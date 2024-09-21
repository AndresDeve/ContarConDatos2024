red_icon <- function(image_name, text) {
  div(
    style = "border: 2px solid #FF7F7F",
    class = "gray-window",  # Clase personalizada para el estilo
    div(class = "red-icon",  # Contenedor para la imagen (vector rojo)
        img(src = image_name, alt = "Icono", style = "width: 30px; height: 30px;")  # Ajusta el tamaño si es necesario
    ),
    div(class = "gray-text",  # Contenedor para el texto
        p(text)
    )
  )
}

green_icon <- function(image_name, text) {
  div(
    style = "border: 2px solid #4CAF50;",  # Borde verde intermedio con padding
    class = "gray-window",  # Clase personalizada para el estilo
    div(
      class = "green-icon",  # Contenedor para la imagen (vector verde)
      img(src = image_name, alt = "Icono", style = "width: 30px; height: 30px; margin-right: 6px;")
    ),
    div(
      class = "gray-text",  # Contenedor para el texto
      p(style = "margin-left: 6px;", text)  # Ajusta margen para el texto
    )
  )
}


ui <- fluidPage(
  tags$head(
    tags$style(HTML("
    .nav-pills > li.active > a {
      background-color: #d3d3d3 !important;
      color: #000000 !important;
      border: none !important;
    }
    .nav-pills > li > a {
      color: #000000 !important;
      background-color: #f0f0f0 !important;
      border: none !important;
    }
    .nav-pills > li > a:hover {
      background-color: #c0c0c0 !important;
    }

    .nav-tabs > li.active > a {
      font-family: Arial, sans-serif;
      font-weight: bold;
      color: #000000;
      font-size: 1.2em;
    }
    .nav-tabs > li > a {
      font-family: Arial, sans-serif;
      font-weight: normal;
      color: #000000;
      font-size: 1em;
    }
    .nav-tabs > li > a:hover {
      color: #333;
    }
    
    /* CSS para que las imágenes se reescalen automáticamente */
    .responsive-img {
      width: 100%;
      height: auto;
    }

    .map-container {
    position: relative;
    width: 100%;
    height: 0;
    padding-bottom: 56.25%;  /* Mantiene una relación de aspecto 16:9 */
    overflow: hidden;
    margin-top: 0px;
    }

.map-container img {
    width: 100%;      /* La imagen ocupará el 100% del ancho del contenedor */
    height: auto;     /* Ajuste proporcional de la altura */
    object-fit: contain;  /* La imagen se ajusta sin recortarse, manteniendo su relación de aspecto */
}

.map-container iframe {
    position: absolute; 
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border: none;
}

    .large-text {
      font-size: 1.2em;
      text-align: left;
      margin-top: 15px;
      margin-bottom: 5px;
    }

    /* Separación entre los pills y el contenido */
    .nav-pills {
      margin-bottom: 15px;
    }
    
    /* Aumentar el tamaño de la tabla en 1.2x */
    table {
      font-size: 1.2em;  /* Aumenta el tamaño del texto en la tabla */
    }
    .centered-plot {
        display: flex;
        justify-content: center;
        align-items: center
    }
   /* Estilo del contenedor principal con fondo gris claro */
    .gray-window {
      display: flex;
      align-items: center;
      padding: 10px;
      border-radius: 15px;
      margin-bottom: 15px;
      box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.1);
    }

    /* Estilo del icono (imagen a la izquierda) */
    .red-icon {
      margin-right: 10px;  /* Espaciado entre el icono y el texto */
    }

    /* Estilo del texto */
    .gray-text {
      font-size: 1.1em;
      color: #333;  /* Texto de color gris oscuro para contraste */
    }
  "))
  ),
  
  titlePanel("Cuando los datos hablan, el mundo escucha: desentrañando la historia de una invasión global"),
  
  tabsetPanel(
    tabPanel("Introducción",
             h3(""),
             sidebarLayout(
               sidebarPanel(
                 h3("La Hormiga Argentina: Un insecto minúsculo con un poder de expansión sin precedentes"),
                 p("La hormiga argentina (Linepithema humile) es una de las especies invasoras más problemáticas del mundo. Originaria de Sudamérica, ha logrado expandirse por diversas regiones del planeta, afectando la biodiversidad y generando altos costos económicos."),
                 hr()
               ),
               mainPanel(
                 tabsetPanel(
                   type = "pills",
                   tabPanel("Estructura social",
                            div(
                              img(src = img_data2, class = "responsive-img", 
                                  style = "display: block; margin-left: auto; margin-right: auto; margin-bottom: 1px;"),
                              div(
                                style = "text-align: center; font-size: 0.85em; color: #555; margin-bottom: 15px;",
                                h6("Las fotos son de Philip Herbst. Para facilitar la identificación, agregamos texto a las fotos.")
                              )
                            ),
                            div(
                              style = "background-color: #f0f0f0; border: 1px solid #1e90ff; color: black; font-size: 1.1em; box-shadow: 2px 2px 5px rgba(0,0,0,0.1); padding: 15px; display: inline-block; border-radius: 10px;",
                              h4("Organización en Castas: Obreras, Machos y Reinas"),
                              p("La hormiga argentina se organiza en tres castas: ", tags$b("obreras, machos y reinas"), ". Las obreras son responsables de realizar todas las tareas diarias de la colonia, como la búsqueda de alimento, el cuidado de las crías, y la defensa del nido. Los machos, por otro lado, tienen la función principal de reproducirse con las reinas, asegurando así la continuidad genética de la colonia. Las reinas, que son las más longevas de las castas, tienen como rol fundamental la puesta de huevos, garantizando la perpetuidad y expansión de la colonia.")
                            )
                   ),
                   tabPanel("Dimensiones corporales",
                            div(
                              img(src = img_data, class = "responsive-img", 
                                  style = "display: block; margin-left: auto; margin-right: auto; margin-bottom: 1px; width: 60%;"),
                              div(
                                style = "text-align: left; font-size: 0.85em; color: #555; margin-bottom: 15px;",
                                h6("Las fotos de hormigas son de Joe A. MacGown. Para facilitar la comparación, agregamos escalas y una punta de lápiz a la misma escala que las hormigas.")
                              )
                            ),
                            div(class = "center-text", 
                                div(
                                  style = "background-color: #f0f0f0; border: 1px solid #1e90ff; color: black; font-size: 1.1em; box-shadow: 2px 2px 5px rgba(0,0,0,0.1); padding: 15px; display: inline-block; border-radius: 10px;",
                                  p("Las obreras de la hormiga argentina son minúsculas, miden tan solo 2.2 - 2.6 mm de largo y pesan aproximadamente 1 mg. Los machos son un poco más grandes, midiendo entre 3.5 y 4 mm de largo, mientras que las reinas son las más grandes de todas, con una longitud de 4.5 a 5 mm.")
                                )
                            )
                   ),
                   tabPanel("Cooperación en supercolonias",
                            h3(""),
                            h3(""),
                            div(
                              style = "background-color: #f0f0f0; border: 1px solid #1e90ff; color: black; font-size: 1.1em; box-shadow: 2px 2px 5px rgba(0,0,0,0.1); padding: 15px; display: inline-block; border-radius: 10px;",
                              h4("Supercolonias: La Alianza de las Hormigas"),
                              p("Además de su estructura en castas, la hormiga argentina destaca por formar ", tags$b("supercolonias"), ", donde múltiples colonias cooperan en lugar de competir. Esta cooperación es notable en el ", tags$b("transporte cooperativo de alimentos"), ", donde las hormigas trabajan juntas para trasladar recursos de manera eficiente.")
                            ),
                            h2(""),
                            h2(""),
                            fluidRow(
                              column(12, 
                                     h4("Secuencia de imágenes que muestra el transporte cooperativo de un cebo proteico por parte de la hormiga Argentina"),
                                     hr()
                              ),
                              column(4,
                                     img(src = img_data.seq1, class = "responsive-img", style = "display: block; margin-left: auto; margin-right: auto; margin-bottom: 15px;")
                              ),
                              column(4,
                                     img(src = img_data.seq2, class = "responsive-img", style = "display: block; margin-left: auto; margin-right: auto; margin-bottom: 15px;")
                              ),
                              column(4,
                                     img(src = img_data.seq3, class = "responsive-img", style = "display: block; margin-left: auto; margin-right: auto; margin-bottom: 15px;")
                              ),
                              column(12, 
                                     h6("Créditos: Andrés Devegili"),
                                     hr()
                              )
                            )
                            
                   )
                 )
               )
             )
    ),
    tabPanel("Distribución",
             h3(""),
             sidebarLayout(
               sidebarPanel(
                 h3("Información sobre la Distribución"),
                 p("La ", tags$b("Distribucion Nativa"), " de la hormiga Argentina se refiere a la región geográfica donde la especie evolucionó y ha existido de forma natural. En contraste, la ", tags$b("Región Invadida"), " se refiere a áreas donde la hormiga Argentina ha sido introducida, ya sea de forma accidental o intencional, y donde ha logrado establecerse."),
                 green_icon("green.png", 
                            "Aunque el nombre hormiga Argentina sugiere una conexión exclusiva con Argentina, el territorio nativo de esta especie también incluye regiones del Uruguay, Paraguay, Bolivia y estados del sur de Brasil."),
               ),
               mainPanel(
                 div(class = "text-center",  
                     actionButton("firstEmpireBtn", "Distribución Nativa"),
                     actionButton("secondEmpireBtn", "Regiones Invadidas"),
                     actionButton("comparisonBtn", "Comparativa Imperial")
                 ),
                 div(
                   class = "map-container", 
                   div(
                     style = "position: relative; top: -100px;",  # Aplica 'unset' solo a la imagen y ajusta su posición
                     imageOutput("worldMap")
                   )
                 ),
                 h3("")
               )
             )
    ),
    tabPanel("El Camino de la Invasión",
             h3(""),
             tabsetPanel(
               type = "pills",
               tabPanel("Propagación Temporal",
                        sidebarLayout(
                          sidebarPanel(
                            h4("Evolución temporal"),
                            sliderInput("year", "Inicia o selecciona un año:",
                                        min = min(hormigaARG_filtered$YearCollected),
                                        max = max(hormigaARG_filtered$YearCollected),
                                        value = min(hormigaARG_filtered$YearCollected),
                                        step = 10,
                                        sep = "",  
                                        animate = animationOptions(interval = 1000, loop = FALSE)),
                            actionButton("reloadBtn", "Limpiar puntos"),
                            h3(""),
                            red_icon("red.png", 
                                     "Mapa interactivo: usa el botón de inicio para ver la expansión de la hormiga argentina a lo largo del tiempo. Podés pausar con el botón correspondiente y hacer zoom con '+' y '-'. Al hacer clic en los puntos rojos, verás la fecha de aparición. Usá 'Limpiar puntos' para reiniciar la secuencia."
                            )
                          ),
                          mainPanel(
                            h4("Presencia y propagación de la hormiga Argentina en distintas regiones del mundo desde su primera aparición registrada"),
                            leafletOutput("map"),
                            p("Base de datos empleada: www.antweb.org")
                            
                          )
                        )
               ),
               tabPanel("Comercio e Invasión",
                        sidebarLayout(
                          sidebarPanel(
                            p("Se piensa que la globalización del comercio ha sido un vehículo crucial para la invasión de la hormiga Argentina. Aprovechando las rutas comerciales, esta especie ha colonizado nuevos territorios a un ritmo alarmante."),
                            h3(""),
                            red_icon("red.png", 
                                     "Grafico de lineas múltiples interactivo: hace clic en las variables de la leyenda para mostrarlas u ocultarlas. Para ver los datos no normalizados, pasa el cursor sobre las curvas. Mantené apretado el clic izquierdo para hacer zoom en una parte del gráfico y doble clic para restablecer la vista original.")),
                          mainPanel(
                            fluidRow(
                              column(12,
                                     h4("Exportaciones y avistamientos de la hormiga Argentina"),
                                     plotlyOutput("tradeRoutesMap", height = "auto"),  # Ajustar altura automáticamente
                                     h3(""),
                                     p("Los datos los normalizamos dividiendo cada valor por el máximo de su serie, permitiendo comparar en una escala común el crecimiento de exportaciones y los avistamientos de la hormiga argentina para revelar su correlación."),
                                     p("Base de datos: www.antweb.org, www.argendata.fund.ar, y www.ourworldindata.org")
                              )
                            )
                          )
                        )
               ),
               tabPanel("Medios de Transporte",
                        sidebarLayout(
                          sidebarPanel(
                            h4("Un polizón de muy difícil detección"),
                            p("Para que la hormiga argentina funde una nueva colonia, es necesario que al menos una reina y un pequeño grupo de aproximadamente 10 obreras estén presentes. Como referencia, este grupo de hormigas podría caber cómodamente dentro de una tapa de botella de plástico."),
                            p("El muy pequeño tamaño de estos grupos, posibilita a la hormiga Argentina a infiltrarse fácilmente en contenedores, cajas, madera y tierra, viajando inadvertida en una variedad de medios de transporte. En la tabla se destacan los principales medios de transporte que probablemente han facilitado su expansión global via el comercio internacional.")
                          ),
                          mainPanel(
                            tableOutput("mediosTable")
                          )
                        )
               )
             )
    ),
    tabPanel("Impacto en la Naturaleza",
             h3(""),
             sidebarLayout(
               sidebarPanel(
                 h4("Consecuencias Ecológicas: El Declive de las Especies Nativas"),
                 p("El impacto de la hormiga argentina en la naturaleza se ha documentado en diversos estudios. 
                Esta especie invasora ha mostrado una gran capacidad para desplazar a otras especies de hormigas, 
                alterando el equilibrio ecológico en las zonas invadidas."),
                 red_icon("red.png", 
                          "Diagrama de Sankey interactivo: posate sobre los tabiques para ver el porcentaje de cada flujo. Mantené cliqueado y arrastrá los tabiques para moverlos donde quieras. Para reiniciar el gráfico, pulsa el ícono de la casa en la esquina superior derecha.")
               ),
               mainPanel(
                 h4(""),
                 h4("Diagrama de flujos en el que se ilustran los impactos de la hormiga argentina sobre la naturaleza"),
                 h3(""),
                 div(style = "all: unset; margin-left: 0px; margin-right: 0px",  # Adjust these values as needed
                     includeHTML("sankey_plot.html")
                 ),
                 h3(""),
                 h3(""),
                 h4("Diagrama de arbol en el que se vislumbra la magnitud de cada tipo de impactos de la hormiga argentina sobre la naturaleza"),
                 tags$div(
                   img(src = "ImpactoNat.png", height = "85%", width = "85%"),
                   style = "text-align: center;"
                 ),
                 h3("")
               )
             )
    ),
    tabPanel("Costos Económicos",
             h3(""),
             sidebarLayout(
               sidebarPanel(
                 h3("El Precio de la Invasión"),
                 p("La presencia de la hormiga argentina no solo tiene consecuencias en la naturaleza, 
                   sino también económicas. En las zonas agrícolas, su invasión ha causado daños en cultivos 
                   y en infraestructuras, generando altos costos para el control y mitigación."),
                 red_icon("red.png", 
                          "Gráfico interactivo de bastones: pasa el mouse sobre los círculos para ver 
                          el costo económico de cada especie de hormiga. Mantene el clic izquierdo y selecciona 
                          la region de interés para hacer 
                          zoom y doble clic para restablecer."),
                 uiOutput("antReferences")
                 ),
               mainPanel(
                 h4("Impacto económico total de las hormigas más invasoras del planeta en el que se destaca en rojo a la hormiga argentina"),
                 plotlyOutput("costosEconomicos", height = "600px"),
                 h3("") 
               )
             )
    ),
    tabPanel("Mirando Hacia el Futuro",
             h3(""),
             sidebarLayout(
               sidebarPanel(
                 h3("¿Qué nos depara el futuro? Predicciones y Prevención"),
                 p("Aunque la hormiga argentina ya ha colonizado gran parte del mundo, todavía hay regiones vulnerables a futuras invasiones. Utilizando modelos predictivos, podemos anticipar las áreas en riesgo y desarrollar estrategias para prevenir su expansión.")
               ),
               mainPanel(
                 tabsetPanel(
                   type = "pills",
                   tabPanel("Argentina", 
                            uiOutput("futurePredictionMap2")  # Muestra el mapa de Argentina
                   ),
                   tabPanel("Mundo", 
                            uiOutput("futurePredictionMap")  # Muestra el mapa del Mundo
                   )
                 )
               )
             )
    )
    
  ),
  
  tags$style(HTML("
  /* El contenido se expande para llenar el espacio disponible */
  .content {
    flex: 1;
    padding-bottom: 10px;
  }

  /* Estilo del footer para que esté siempre al final */
  .custom-footer {
    background-color: #f8f9fa;
    color: #000000;
    text-align: center;
    padding: 10px;
    width: 100%;
    border-top: 1px solid #ddd;
  }

  /* Estilo permanente para los enlaces con color indicativo */
  a {
    color: #336699; /* Color gris azulado permanente para los enlaces */
    text-decoration: none; /* Sin subrayado */
  }

  /* Cambios mínimos en hover para que no distraiga */
  a:hover {
    text-decoration: underline; /* Subrayado solo al hacer hover */
    color: #336699; /* Mantiene el mismo color pero añade subrayado al pasar el mouse */
  }
")),
  
  div(class = "wrapper",
      div(class = "content",
          # Aquí iría tu contenido de la página
      ),
      
      div(class = "custom-footer",
          HTML(
            "<p style='font-size: 0.9em; line-height: 1em;'> 
          <a href='https://udesa.edu.ar/contarcondatos' target='_blank'>Contar con datos 2024</a>
          </p>
          <p style='font-size: 0.9em; line-height: 1em;'> 
          Desarrollaron la visualización 
          <a href='mailto:andresdevegili@gmail.com'>Andrés Devegili</a> y 
          <a href='mailto:ezepozzi@gmail.com'>Ezequiel Pozzi-Tay</a>
          </p>"
          )
      )
  )
  
  
  
)