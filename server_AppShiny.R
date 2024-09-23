server <- function(input, output, session) {
  
  reactive_data <- reactive({
    cumulative_data_df %>%
      filter(YearFrame <= input$year) %>%
      dplyr::select(LocLongitude, LocLatitude, YearCollected)
  })
  
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addProviderTiles(providers$CartoDB.Positron) %>%
      setView(lng = 0, lat = 0, zoom = 1.2) %>%
      addLegend("topright", colors = "red", labels = "Hormiga Argentina", title = "Presencia")
  })
  
  observe({
    leafletProxy("map", data = reactive_data()) %>%
      clearMarkers() %>%
      addCircles(lng = ~LocLongitude, lat = ~LocLatitude, 
                 color = "red", fillOpacity = 0.3, radius = 50000, 
                 popup = ~paste("Año:", YearCollected))
  })
  
  observeEvent(input$reloadBtn, {
    output$map <- renderLeaflet({
      leaflet() %>%
        addTiles() %>%
        addProviderTiles(providers$CartoDB.Positron) %>%
        setView(lng = 0, lat = 0, zoom = 1.2) %>%
        addLegend("topright", colors = "red", labels = "Hormiga Argentina", title = "Presencia")
    })
  })
  
  output$tradeRoutesMap <- renderPlotly({
    # Código existente para tradeRoutesMap
  })
  
  output$futurePredictionMap <- renderUI({
    tags$div(class = "map-container",
             tags$iframe(
               src = "index2.html",
               width = "auto", 
               height = "auto",
               frameborder = 0, 
               scrolling = "auto"
             )
    )
  })
  
  output$futurePredictionMap2 <- renderUI({
    tags$div(class = "map-container",
             tags$iframe(
               src = "arg/index2_arg.html",
               width = "auto", 
               height = "auto",
               frameborder = 0, 
               scrolling = "auto"
             )
    )
  })
  
  output$costosEconomicos <- renderPlotly({
    impacto_economico_promedio <- impacto_economico %>%
      group_by(Nombre_comun) %>%
      summarise(promedio_coste = sum(CosteTotalUSD_2017_tipo_cambio, na.rm = TRUE)) %>%
      mutate(Categoria = ifelse(Nombre_comun == "Hormiga argentina", "Hormiga Argentina", "Otras hormigas invasoras"))
    
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
    
    ggplotly(p, tooltip = "text") %>%
      layout(showlegend = FALSE)
  })
  
  map_data <- reactiveValues(current_map = NULL)
  
  observeEvent(TRUE, {
    map_data$current_map <- "first"
  }, once = TRUE)
  
  observeEvent(input$firstEmpireBtn, {
    map_data$current_map <- "first"
  })
  
  observeEvent(input$secondEmpireBtn, {
    map_data$current_map <- "second"
  })
  
  observeEvent(input$comparisonBtn, {
    map_data$current_map <- "comparison"
  })
  
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
  
  output$tradeRoutesMap <- renderPlotly({
    p <- ggplot(combined_df, aes(x = anio)) +
      geom_line(aes(y = exportaciones_norm, color = "Exportaciones Argentina"), size = 0.8) + 
      geom_line(aes(y = acumulado_norm, color = "Avistamientos de hormiga Argentina"), size = 0.8) +
      geom_line(aes(y = exportaciones_mund_norm, color = "Exportaciones Globales"), size = 0.8) + 
      geom_point(aes(y = exportaciones_norm, 
                     text = paste("Año:", anio, "<br>Exportaciones Argentina:", cantidades_exportacion_ferreres), 
                     color = "Exportaciones Argentina"), size = 0.01) +
      geom_point(aes(y = acumulado_norm, 
                     text = paste("Año:", anio, "<br>Avistamientos:", acumulado), 
                     color = "Avistamientos de hormiga Argentina"), size = 0.01) +
      geom_point(aes(y = exportaciones_mund_norm, 
                     text = paste("Año:", anio, "<br>Exportaciones Globales:", world_trade_relative_1913), 
                     color = "Exportaciones Globales"), size = 0.01) +
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
    
    ggplotly(p, tooltip = "text") %>%
      layout(
        legend = list(
          title = list(text = ""),
          orientation = "v",
          x = 0.5,
          y = 0.9,
          xanchor = "center",
          yanchor = "top"
        ),
        autosize = TRUE
      )
  })
  
  observeEvent(input$showReferences, {
    showModal(
      modalDialog(
        title = "Especies de Hormigas",
        uiOutput("antReferences"),
        easyClose = TRUE,
        footer = NULL
      )
    )
  })
  
  output$antReferences <- renderUI({
    lista_hormigas <- unique(impacto_economico %>%
                               filter(!(Nombre_comun == "Hormiga faraón" & Especie == "Monomorium pharaonis")) %>%
                               select(Nombre_comun, Especie))
    
    tagList(
      h3(""),
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
  
  observeEvent(input$show_modal, {
    showModal(
      modalDialog(
        title = "Bases de datos consultadas",
        tags$ul(
          tags$li(HTML("AntWiki (<a href='https://www.antwiki.org' target='_blank'>www.antwiki.org</a>): Datos sobre historia natural de la hormiga argentina.")),
          tags$li(HTML("AntWeb (<a href='https://www.antweb.org' target='_blank'>www.antweb.org</a>): Datos sobre distribucion de la hormiga argentina.")),
          tags$li(HTML("ArgenData (<a href='https://www.argendata.fund.ar' target='_blank'>www.argendata.fund.ar</a>): Datos de comercio de Argentina.")),
          tags$li(HTML("Our World in Data (<a href='https://www.ourworldindata.org' target='_blank'>www.ourworldindata.org</a>): Datos de comercio internacionales.")),
          tags$li("Los datos sobre el impacto en la naturaleza fueron elaborados en base al artículo científico: Angulo, E., Guénard, B., Balzani, P., Bang, A., Frizzi, F., Masoni, A., ... & Santini, G. (2024). The Argentine ant, Linepithema humile: Natural history, ecology and impact of a successful invader. Entomologia Generalis, 44, 41-61."),
          tags$li(HTML("InvaCost (<a href='https://www.invacost.fr' target='_blank'>www.invacost.fr</a>): Datos sobre costos economicos de especies invaasoras."))
        ),
        easyClose = TRUE,
        footer = NULL
      )
    )
  })
  
  output$treemapHabitat <- renderPlotly({
    plot_ly(
      data_habitat,
      labels = ~Habitat,
      parents = "",
      values = ~n,
      type = 'treemap',
      textinfo = "label",
      insidetextanchor = "middle",
      hovertemplate = paste('Porcentaje: %{percentEntry:.1%}<extra></extra>'),
      marker = list(
        colors = viridis::viridis(nrow(data_habitat)),
        line = list(width = 2, color = "white")
      ),
      textfont = list(size = 24)
    ) %>%
      layout(
        title = list(
          text = "Habitat ocupado por la hormiga argentina sobre el que se generó el costo económico",
          x = 0.01,
          y = 0.95,
          font = list(size = 19, color = "black")
        ),
        hoverlabel = list(font = list(size = 16)),
        hovermode = 'closest'
      ) %>%
      style(
        hoverinfo = "text",
        hoverlabel = list(bgcolor = "white"),
        selected = list(marker = list(opacity = 1)),
        unselected = list(marker = list(opacity = 0.5))
      )
  })
  
  output$treemapCost <- renderPlotly({
    plot_ly(
      data_cost,
      labels = ~Type_of_cost,
      parents = "",
      values = ~n,
      type = 'treemap',
      textinfo = "label",
      insidetextanchor = "middle",
      hovertemplate = paste('Porcentaje: %{percentEntry:.1%}<extra></extra>'),
      marker = list(
        colors = viridis::viridis(nrow(data_cost)),
        line = list(width = 2, color = "white")
      ),
      textfont = list(size = 24)
    ) %>%
      layout(
        title = list(
          text = "Tipo de costo económico generado por la hormiga argentina",
          x = 0.01,
          y = 0.95,
          font = list(size = 19, color = "black")
        ),
        hoverlabel = list(font = list(size = 16)),
        hovermode = 'closest'
      ) %>%
      style(
        hoverinfo = "text",
        hoverlabel = list(bgcolor = "white"),
        selected = list(marker = list(opacity = 1)),
        unselected = list(marker = list(opacity = 0.5))
      )
  })
  
}
