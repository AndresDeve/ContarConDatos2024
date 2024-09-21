server <- function(input, output, session) {
  
  # Datos reactivos basados en el año seleccionado
  reactive_data <- reactive({
    cumulative_data_df %>%
      filter(YearFrame <= input$year) %>%
      dplyr::select(LocLongitude, LocLatitude, YearCollected)
  })
  
  # Mapa inicial renderizado
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addProviderTiles(providers$CartoDB.Positron) %>%
      setView(lng = 0, lat = 0, zoom = 1.2) %>%
      addLegend("topright", colors = "red", labels = "Hormiga Argentina", title = "Presencia")
  })
  
  # Observador para actualizar el mapa cuando cambia el año
  observe({
    leafletProxy("map", data = reactive_data()) %>%
      clearMarkers() %>%
      addCircles(lng = ~LocLongitude, lat = ~LocLatitude, 
                 color = "red", fillOpacity = 0.3, radius = 50000, 
                 popup = ~paste("Año:", YearCollected))
  })
  
  # Observador para limpiar el mapa al presionar el botón de recarga
  observeEvent(input$reloadBtn, {
    output$map <- renderLeaflet({
      leaflet() %>%
        addTiles() %>%
        addProviderTiles(providers$CartoDB.Positron) %>%
        setView(lng = 0, lat = 0, zoom = 1.2) %>%
        addLegend("topright", colors = "red", labels = "Hormiga Argentina", title = "Presencia")
    })
  })
  
  # Renderizar el gráfico interactivo en la pestaña "El Camino de la Invasión"
  output$tradeRoutesMap <- renderPlotly({
    # Código existente para tradeRoutesMap
  })
  
  # Renderizar el mapa predictivo en la pestaña "Mirando Hacia el Futuro" MAPA MUNDO
  output$futurePredictionMap <- renderUI({
    tags$div(class = "map-container",  # Use the map-container class for responsiveness
             tags$iframe(
               src = "index2.html",  # Asegúrate de que el archivo esté en la carpeta www/
               width = "auto", 
               height = "auto",  # El alto será ajustado por el CSS
               frameborder = 0, 
               scrolling = "auto"
             )
    )
  })
  
  # Renderizar el mapa predictivo en la pestaña "Mirando Hacia el Futuro" MAPA ARG
  output$futurePredictionMap2 <- renderUI({
    tags$div(class = "map-container",  # Usa la clase map-container para la capacidad de respuesta
             tags$iframe(
               src = "arg/index2_arg.html",  # Ajusta la ruta al archivo HTML dentro de la carpeta www/arg
               width = "auto", 
               height = "auto",  # El alto será ajustado por el CSS
               frameborder = 0, 
               scrolling = "auto"
             )
    )
  })
  
  # Agregar el renderPlotly para el gráfico de costos económicos
  output$costosEconomicos <- renderPlotly({
    # Calcular el promedio del coste por especie
    impacto_economico_promedio <- impacto_economico %>%
      group_by(Nombre_comun) %>%
      summarise(promedio_coste = sum(CosteTotalUSD_2017_tipo_cambio, na.rm = TRUE)) %>%
      mutate(Categoria = ifelse(Nombre_comun == "Hormiga argentina", "Hormiga Argentina", "Otras hormigas invasoras"))
    
    # Crear el gráfico de lollipop
    p <- ggplot(impacto_economico_promedio, aes(x = promedio_coste, 
                                                y = reorder(Nombre_comun, promedio_coste),
                                                color = Categoria,
                                                text = paste0(format(round(promedio_coste), big.mark = ".", decimal.mark = ","), " $USD"))) +
      geom_segment(aes(yend = Nombre_comun, x = 1, xend = promedio_coste), size = 0.7) +
      geom_point(size = 5) +
      scale_x_log10(labels = label_number(big.mark = ".", decimal.mark = ",")) +
      expand_limits(x = max(impacto_economico_promedio$promedio_coste) * 1.2) +
      theme_minimal() +
      labs(x = "Costos económicos (USD, tipo de cambio 2017)", 
           y = "Hormigas invasoras") +
      scale_color_manual(values = c("Hormiga Argentina" = "red", "Otras hormigas invasoras" = "black")) +
      theme(axis.text.y = element_text(size = rel(1.2), color = "black"),
            axis.text.x = element_text(size = rel(1.2), color = "black"),
            axis.title = element_text(size = rel(1.2), face = "bold"),
            plot.title = element_text(size = rel(1.2), face = "bold", hjust = 0.5),
            panel.grid.major.y = element_blank(),
            panel.grid.minor.y = element_blank(),
            plot.margin = unit(c(1, 2, 1, 1), "cm"))
    
    # Convertir a gráfico interactivo
    ggplotly(p, tooltip = "text") %>%
      layout(showlegend = FALSE)
  })
  
  # --- Código agregado para la pestaña "Distribución" ---
  
  # Crear un reactive value para almacenar el estado actual del mapa o contenido
  map_data <- reactiveValues(current_map = NULL)
  
  # Inicializar el mapa con el primer imperio
  observeEvent(TRUE, {
    map_data$current_map <- "first"
  }, once = TRUE)
  
  # Actualizar el mapa al presionar el botón del Primer Imperio
  observeEvent(input$firstEmpireBtn, {
    map_data$current_map <- "first"
  })
  
  # Actualizar el mapa al presionar el botón del Segundo Imperio
  observeEvent(input$secondEmpireBtn, {
    map_data$current_map <- "second"
  })
  
  # Mostrar la imagen del "Comparativo de Imperios" al presionar el botón correspondiente
  observeEvent(input$comparisonBtn, {
    map_data$current_map <- "comparison"
  })
  
  # Renderizar la imagen basada en el estado actual desde archivos PNG
  output$worldMap <- renderImage({
    if (map_data$current_map == "first") {
      list(src = "map1.png",
           contentType = "image/png",
           alt = "Mapa del Primer Imperio")
    } else if (map_data$current_map == "second") {
      list(src = "map2.png",
           contentType = "image/png",
           alt = "Mapa del Segundo Imperio")
    } else if (map_data$current_map == "comparison") {
      list(src = "imperios.png",
           contentType = "image/png",
           alt = "Comparativo de Imperios")
    } else {
      list(src = NULL,
           contentType = "image/png",
           alt = "No hay mapa disponible")
    }
  }, deleteFile = FALSE)
  
  # Renderizar la tabla en la UI
  output$mediosTable <- renderTable({
    medios_transporte <- data.frame(
      "Medios de transporte" = c("Rutas Marítimas", 
                                 "Vehículos Terrestres", 
                                 "Aeronaves", 
                                 "Material de Jardinería y Paisajismo", 
                                 "Maderas y Productos Forestales"),
      Descripción = c("Contenedores de carga, madera de embalaje, y mercancías en barcos.",
                      "Distribución secundaria a través de camiones y otros vehículos que transportan mercancías dentro y entre países.",
                      "En aviones comerciales dentro de equipaje y mochilas de pasajeros y tripulantes. En aviones de carga dentro contenedores de carga, madera de embalaje, y mercancías.",
                      "Plantas, macetas, y tierra, donde las hormigas pueden establecerse y viajar inadvertidamente.",
                      "Madera de embalaje, palets, y otros productos forestales exportados."),
      check.names = FALSE
    )
    medios_transporte
  }, striped = TRUE, hover = TRUE, bordered = TRUE)
  
  # Renderizar el gráfico interactivo en la pestaña "El Camino de la Invasión"
  output$tradeRoutesMap <- renderPlotly({
    # Crear el gráfico de líneas de exportaciones y avistamientos
    p <- ggplot(combined_df, aes(x = anio)) +
      geom_line(aes(y = exportaciones_norm, color = "Exportaciones Argentina"), size = 0.8) + 
      geom_line(aes(y = acumulado_norm, color = "Avistamientos de hormiga Argentina"), size = 0.8) +
      geom_line(aes(y = exportaciones_mund_norm, color = "Exportaciones Globales"), size = 0.8) + 
      geom_point(aes(y = exportaciones_norm, 
                     text = paste("Año:", anio, "<br>Exportaciones Argentina:", cantidades_exportacion_ferreres), 
                     color = "Exportaciones Argentina"), size = 0.01) +  # Puntos invisibles para tooltips
      geom_point(aes(y = acumulado_norm, 
                     text = paste("Año:", anio, "<br>Avistamientos:", acumulado), 
                     color = "Avistamientos de hormiga Argentina"), size = 0.01) +  # Puntos invisibles para tooltips
      geom_point(aes(y = exportaciones_mund_norm, 
                     text = paste("Año:", anio, "<br>Exportaciones Globales:", world_trade_relative_1913), 
                     color = "Exportaciones Globales"), size = 0.01) +  # Puntos invisibles para tooltips
      labs(
        x = "Año",
        y = "Valores Normalizados"
      ) +
      scale_color_brewer(palette = "Set1") +
      theme_minimal() +
      theme(
        legend.position = "top",
        legend.title = element_blank(), 
        legend.text = element_text(size = 12), 
        axis.title = element_text(size = 14), 
        axis.text = element_text(size = 12),
        plot.title = element_text(size = 15),
        plot.subtitle = element_text(size = 14),
        panel.grid.major.x = element_blank(),  
        panel.grid.minor.x = element_blank()
      ) +
      guides(color = guide_legend(ncol = 1))
    
    # Convertir a gráfico interactivo con plotly
    ggplotly(p, tooltip = "text") %>%
      layout(
        legend = list(
          title = list(text = ""),
          orientation = "v",  # Orientación vertical
          x = 0.5,            # Centrar en el eje x
          y = 0.9,            # Colocar en la parte superior
          xanchor = "center", # Ancla en el centro
          yanchor = "top"     # Ancla en la parte superior
        ),
        autosize = TRUE  # Permitir que el gráfico se redimensione automáticamente
      )
  })
  
  # Renderizar la lista de nombres comunes y científicos sin viñetas y en itálica
  output$antReferences <- renderUI({
    # Seleccionar los nombres comunes y científicos, excluyendo la Hormiga faraón
    lista_hormigas <- unique(impacto_economico %>%
                               filter(!(Nombre_comun == "Hormiga faraón" & Especie == "Monomorium pharaonis")) %>%
                               select(Nombre_comun, Especie))
    
    # Generar la lista de referencias sin viñetas ni sangría
    tagList(
      h3(""),
      # Crear una lista sin formato para mostrar los nombres
      div(
        lapply(1:nrow(lista_hormigas), function(i) {
          div(
            style = "margin: 0; padding: 0;", 
            HTML(paste0(lista_hormigas$Nombre_comun[i], ": <i>", lista_hormigas$Especie[i], "</i>"))
          )
        })
      )
    )
  })
  
  
  
}
