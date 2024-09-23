red_icon <- function(image_name, text) {
  div(
    style = "border: 2px solid #FF7F7F",
    class = "gray-window",
    div(class = "red-icon",
        img(src = image_name, alt = "Icono", style = "width: 30px; height: 30px;")
    ),
    div(class = "gray-text",
        p(text)
    )
  )
}

green_icon <- function(image_name, text) {
  div(
    style = "border: 2px solid #4CAF50;",
    class = "gray-window",
    div(
      class = "green-icon",
      img(src = image_name, alt = "Icono", style = "width: 30px; height: 30px; margin-right: 6px;")
    ),
    div(
      class = "gray-text",
      p(style = "margin-left: 6px;", text)
    )
  )
}

blue_icon <- function(image_name, text) {
  div(
    style = "border: 2px solid #2196F3;",
    class = "gray-window",
    div(
      class = "blue-icon",
      img(src = image_name, alt = "Icono", style = "height: 30px; width: auto; margin-right: 6px;")
    ),
    div(
      class = "gray-text",
      p(style = "margin-left: 6px; font-size: 1.1em;", text)
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
    
    .responsive-img {
      width: 100%;
      height: auto;
    }

    .map-container {
    position: relative;
    width: 100%;
    height: 0;
    padding-bottom: 56.25%;
    overflow: hidden;
    margin-top: 0px;
    }

.map-container img {
    width: 100%;
    height: auto;
    object-fit: contain;
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

    .nav-pills {
      margin-bottom: 15px;
    }
    
    table {
      font-size: 1.2em;
    }
    .centered-plot {
        display: flex;
        justify-content: center;
        align-items: center
    }
    .gray-window {
      display: flex;
      align-items: center;
      padding: 10px;
      border-radius: 15px;
      margin-bottom: 15px;
      box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.1);
    }

    .red-icon {
      margin-right: 10px;
    }

    .gray-text {
      font-size: 1.1em;
      color: #333;
    }
  "))
  ),
  
  titlePanel("Cuando los datos hablan, el mundo escucha: desentrañando la historia de una invasión global"),
  
  tabsetPanel(
    tabPanel(
      "Introducción",
      h3(""),
      sidebarLayout(
        sidebarPanel(
          h3("La Hormiga Argentina: Un insecto minúsculo con un poder de expansión sin precedentes"),
          p("La hormiga argentina (", tags$i("Linepithema humile"), ") es una de las especies invasoras más problemáticas del mundo. Originaria de Sudamérica, ha logrado expandirse por diversas regiones del planeta, afectando la biodiversidad y generando altos costos económicos."),
          hr(),
          
          div(style = "margin: 20px 0; border-top: 1px solid #ccc;"),
          
          div(
            style = "display: grid; grid-template-columns: auto 1fr; gap: 10px; align-items: center; margin-bottom: 10px;",
            img(src = "blue.png", height = "30px"),
            p(style = "margin: 0;", "Información importante"),
            img(src = "red.png", height = "30px"),
            p(style = "margin: 0;", "Aviso de interactividad"),
            img(src = "green.png", height = "30px"),
            p(style = "margin: 0;", "Curiosidades")
          )
        ),
        mainPanel(
          tabsetPanel(
            type = "pills",
            tabPanel(
              "Estructura social",
              div(
                img(src = img_data2, class = "responsive-img", style = "display: block; margin-left: auto; margin-right: auto; margin-bottom: 1px;"),
                div(style = "text-align: center; font-size: 0.85em; color: #555; margin-bottom: 15px;", h6("Las fotos son de Philip Herbst. Para facilitar la identificación, agregamos texto a las fotos."))
              ),
              blue_icon("blue.png", HTML("La hormiga argentina se organiza en tres castas: <b>obreras, machos y reinas</b>.")),
              p("Las ", tags$b("obreras"), " son responsables de realizar todas las tareas diarias de la colonia, como la búsqueda de alimento, el cuidado de las crías, y la defensa del nido. Los ", tags$b("machos"), " por otro lado, tienen la función principal de reproducirse con las reinas, asegurando así la continuidad genética de la colonia. Las ", tags$b("reinas"), ", que son las más longevas de las castas, tienen como rol fundamental la puesta de huevos, garantizando la perpetuidad y expansión de la colonia.")
            ),
            tabPanel(
              "Dimensiones corporales",
              div(
                img(src = img_data, class = "responsive-img", style = "display: block; margin-left: auto; margin-right: auto; margin-bottom: 1px; width: 60%;"),
                div(style = "text-align: left; font-size: 0.85em; color: #555; margin-bottom: 15px;", h6("Las fotos de hormigas son de Joe A. MacGown. Para facilitar la comparación, agregamos escalas y una punta de lápiz a la misma escala que las hormigas."))
              ),
              blue_icon("blue.png", "Si alguna vez te cruzaste con una hormiga argentina, lo más probable es que haya sido una obrera. Las obreras son muy pequeñas, midiendo 2.2 - 2.6 mm de largo y pesando tan solo 1 mg."),
              p("Los machos son un poco más grandes, midiendo entre 3.5 y 4 mm de largo. Y las reinas son las más grandes de todas las castas, con una longitud de 4.5 a 5 mm.")
            ),
            tabPanel(
              "Cooperación en supercolonias",
              h3(""),
              h3(""),
              blue_icon("blue.png", HTML("La hormiga argentina destaca por formar <b>supercolonias</b>, donde múltiples colonias cooperan en lugar de competir. Esta característica comportamental las hace excelentes invasoras.")),
              p("Esta cooperación es notable en el ", tags$b("transporte cooperativo de alimentos"), ", donde las hormigas trabajan juntas para trasladar recursos de manera eficiente."),
              h2(""),
              h2(""),
              fluidRow(
                column(12, h4("Secuencia de imágenes que muestra un grupo de obreras realizando transporte cooperativo de un cebo proteico"), hr()),
                column(4, img(src = img_data.seq1, class = "responsive-img", style = "display: block; margin-left: auto; margin-right: auto; margin-bottom: 15px;")),
                column(4, img(src = img_data.seq2, class = "responsive-img", style = "display: block; margin-left: auto; margin-right: auto; margin-bottom: 15px;")),
                column(4, img(src = img_data.seq3, class = "responsive-img", style = "display: block; margin-left: auto; margin-right: auto; margin-bottom: 15px;")),
                column(12, h6("Créditos: Andrés Devegili"), hr())
              )
            )
          )
        )
      ),
      br()
    ),
    tabPanel("Distribución",
             h3(""),
             sidebarLayout(
               sidebarPanel(
                 h3("Información sobre la Distribución"),
                 p("La ", tags$b("Distribucion Nativa"), " de la hormiga Argentina se refiere a la región geográfica donde la especie evolucionó y ha existido de forma natural. En contraste, la ", tags$b("Región Invadida"), " se refiere a áreas donde la hormiga Argentina ha sido introducida, ya sea de forma accidental o intencional, y donde ha logrado establecerse."),
                 blue_icon("blue.png", "La hormiga argentina ha expandido su rango desde América del Sur a gran parte del planeta."),
                 h3(""),
                 green_icon("green.png", "Curiosidad: Aunque el nombre hormiga Argentina sugiere una conexión exclusiva con Argentina, el territorio nativo de esta especie también incluye regiones del Uruguay, Paraguay, Bolivia y estados del sur de Brasil."),
                 div(style = "margin: 20px 0; border-top: 1px solid #ccc;"),
                 div(
                   style = "display: grid; grid-template-columns: auto 1fr; gap: 10px; align-items: center; margin-bottom: 10px;",
                   img(src = "blue.png", height = "30px"),
                   p(style = "margin: 0;", "Información importante"),
                   img(src = "red.png", height = "30px"),
                   p(style = "margin: 0;", "Aviso de interactividad"),
                   img(src = "green.png", height = "30px"),
                   p(style = "margin: 0;", "Curiosidades")
                 )
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
                     style = "position: relative; top: -100px;",
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
                            red_icon("red.png", "Usa el botón de inicio para ver la expansión de la hormiga argentina a lo largo del tiempo. Podés pausar con el botón correspondiente y hacer zoom con '+' y '-'. Al hacer clic en los puntos rojos, verás la fecha de aparición. Usá 'Limpiar puntos' para reiniciar la secuencia."),
                            div(style = "margin: 20px 0; border-top: 1px solid #ccc;"),
                            div(
                              style = "display: grid; grid-template-columns: auto 1fr; gap: 10px; align-items: center; margin-bottom: 10px;",
                              img(src = "blue.png", height = "30px"),
                              p(style = "margin: 0;", "Información importante"),
                              img(src = "red.png", height = "30px"),
                              p(style = "margin: 0;", "Aviso de interactividad"),
                              img(src = "green.png", height = "30px"),
                              p(style = "margin: 0;", "Curiosidades")
                            )
                          ),
                          mainPanel(
                            h4("Presencia y propagación de la hormiga Argentina en distintas regiones del mundo desde su primera aparición registrada"),
                            leafletOutput("map")
                          )
                        )
               ),
               tabPanel("Comercio e Invasión",
                        sidebarLayout(
                          sidebarPanel(
                            p("Se piensa que la globalización del comercio ha sido un vehículo crucial para la invasión de la hormiga Argentina. Aprovechando las rutas comerciales, esta especie ha colonizado nuevos territorios a un ritmo alarmante."),
                            h3(""),
                            red_icon("red.png", "Hace clic en las variables de la leyenda para mostrarlas u ocultarlas. Para ver los datos no normalizados, pasa el cursor sobre las curvas. Mantené apretado el clic izquierdo para hacer zoom en una parte del gráfico y doble clic para restablecer la vista original.")
                          ),
                          mainPanel(
                            blue_icon("blue.png", "La muy fuerte correlación de las lineas del gráfico indica que el comercio global podría ser clave en la expansión de la hormiga argentina por el mundo."),
                            fluidRow(
                              column(12,
                                     h4("Exportaciones y avistamientos de la hormiga Argentina"),
                                     plotlyOutput("tradeRoutesMap", height = "auto"),
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
                 p("El impacto de la hormiga argentina en la naturaleza se ha documentado en diversos estudios. Esta especie invasora ha mostrado una gran capacidad para desplazar a otras especies de hormigas, alterando el equilibrio ecológico en las zonas invadidas."),
                 red_icon("red.png", "Diagrama de flujos: posa el cursor sobre los tabiques para ver el porcentaje de cada flujo. Mantené cliqueado y arrastrá los tabiques para desplazarlos. Para reiniciar el gráfico, pulsa el ícono de la casa en la esquina superior derecha."),
                 div(style = "margin: 20px 0; border-top: 1px solid #ccc;"),
                 div(
                   style = "display: grid; grid-template-columns: auto 1fr; gap: 10px; align-items: center; margin-bottom: 10px;",
                   img(src = "blue.png", height = "30px"),
                   p(style = "margin: 0;", "Información importante"),
                   img(src = "red.png", height = "30px"),
                   p(style = "margin: 0;", "Aviso de interactividad"),
                   img(src = "green.png", height = "30px"),
                   p(style = "margin: 0;", "Curiosidades")
                 )
               ),
               mainPanel(
                 h4(""),
                 blue_icon("blue.png", "La hormiga argentina impacta negativamente a insectos, vertebrados, plantas nativas, y microbios. Sin embargo, en algunos casos, su presencia puede tener efectos neutros o incluso positivos sobre ciertas especies nativas."),
                 h4("Diagrama de flujos en el que se ilustran los impactos de la hormiga argentina sobre la naturaleza"),
                 h3(""),
                 div(style = "all: unset; margin-left: 0px; margin-right: 0px",
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
    tabPanel(
      "Costos Económicos",
      h3(""),
      sidebarLayout(
        sidebarPanel(
          h3("El Precio de la Invasión"),
          p(
            "La presencia de la hormiga argentina no solo tiene consecuencias en la naturaleza, sino también económicas. En las zonas agrícolas, su invasión ha causado daños en cultivos y en infraestructuras, generando altos costos para el control y mitigación."
          ),
          red_icon(
            "red.png",
            "Gráfico de bastones: posa el cursor sobre los círculos para ver el costo económico de cada especie de hormiga. Presioná el boton Especies para saber el nombre cientifico de las hormigas mencionadas en el gráfico."
          ),
          h3(""),
          red_icon(
            "red.png",
            "Gráficos de árbol: posa el cursor sobre los recuadros para ver qué porcentaje representan respecto al total."
          ),
          div(style = "margin: 20px 0; border-top: 1px solid #ccc;"),
          div(
            style = "display: grid; grid-template-columns: auto 1fr; gap: 10px; align-items: center; margin-bottom: 10px;",
            img(src = "blue.png", height = "30px"),
            p(style = "margin: 0;", "Información importante"),
            img(src = "red.png", height = "30px"),
            p(style = "margin: 0;", "Aviso de interactividad"),
            img(src = "green.png", height = "30px"),
            p(style = "margin: 0;", "Curiosidades")
          )
        ),
        mainPanel(
          blue_icon("blue.png", "Se estima que la invasión de la hormiga argentina generó costos por 19.5 millones de dólares"),
          h4("Impacto económico total de las hormigas más invasoras del planeta en el que se destaca en rojo a la hormiga argentina"),
          plotlyOutput("costosEconomicos", height = "600px"),
          actionButton("showReferences", "Especies", style = "margin-left: 150px;"),
          h3(""),
          h3(""),
          br(),
          blue_icon("blue.png", "Los costos económicos ocurren principalmente por los impactos que la hormiga argentina genera en las ciudades."),
          plotlyOutput("treemapHabitat", height = "500px"),
          blue_icon("blue.png", "El dinero que se emplea en erradicar a la hormiga argentina de domicilios y otras areas es lo que genera mas costo."),
          plotlyOutput("treemapCost", height = "500px")
        )
      )
    ),
    tabPanel(
      "Mirando Hacia el Futuro",
      h3(""),
      sidebarLayout(
        sidebarPanel(
          h3("¿Qué nos depara el futuro? Predicciones y Prevención"),
          p(
            "Aunque la hormiga argentina ya ha colonizado gran parte del mundo, todavía hay regiones vulnerables a futuras invasiones. Utilizando modelos predictivos, podemos anticipar las áreas en riesgo y desarrollar estrategias para prevenir su expansión."
          ),
          red_icon(
            "red.png",
            "Mapas: en el boton ubicado en la esquina superior derecha podes seleccionar distintas capas. Si te posas sobre los de presencia de la hormiga argentina (puntos rojos) podes saber el año en el que fue reportada la presencia."
          ),
          div(style = "margin: 20px 0; border-top: 1px solid #ccc;"),
          div(
            style = "display: grid; grid-template-columns: auto 1fr; gap: 10px; align-items: center; margin-bottom: 10px;",
            img(src = "blue.png", height = "30px"),
            p(style = "margin: 0;", "Información importante"),
            img(src = "red.png", height = "30px"),
            p(style = "margin: 0;", "Aviso de interactividad"),
            img(src = "green.png", height = "30px"),
            p(style = "margin: 0;", "Curiosidades")
          )
        ),
        mainPanel(
          tabsetPanel(
            type = "pills",
            tabPanel(
              "Argentina",
              h4("Probabilidad de expansion de la hormiga argentina dentro de Argentina"),
              blue_icon("blue.png", "Según el modelo de predicción, la hormiga argentina podría seguir expandiéndose por gran parte del territorio nacional, afectando especialmente la franja central, la región pampeana, y el norte y la costa patagónica. Estas áreas, debido a su clima y características ambientales, son altamente vulnerables a futuras invasiones, lo que resalta la importancia de implementar medidas preventivas."),
              uiOutput("futurePredictionMap2")
            ),
            tabPanel(
              "Mundo",
              h4("Probabilidad de expansion de la hormiga argentina en el Mundo"),
              blue_icon("blue.png",
                        "Según el modelo de predicción, la hormiga argentina podría continuar su expansión en diversas regiones del planeta, con especial riesgo en el este asiático, la zona más densamente poblada del mundo. Esta región, junto con otras áreas urbanizadas, presenta condiciones favorables para la invasión debido a su alta concentración de actividades humanas y redes de transporte globales."
              ),
              uiOutput("futurePredictionMap")
            ),
            tabPanel(
              "Medidas de Prevención",
              blue_icon("blue.png", "Implementar medidas de control y monitoreo es clave para frenar la expansión de la hormiga."),
              h3(""),
              h4("Principales Estrategias de Prevención"),
              h3(""),
              h3(""),
              tags$div(
                style = "display: flex; flex-wrap: wrap; gap: 20px; justify-content: center;",
                tags$div(
                  style = "display: flex; gap: 20px; width: 100%; justify-content: space-around;",
                  tags$div(
                    style = "flex: 1; text-align: center;",
                    tags$img(src = "control_biologico_icon.png", height = "80px"),
                    tags$p(tags$b("Control Biológico")),
                    tags$p("Uso de depredadores y patógenos específicos para reducir las poblaciones de hormigas.")
                  ),
                  tags$div(
                    style = "flex: 1; text-align: center;",
                    tags$img(src = "mip_icon.png", height = "80px"),
                    tags$p(tags$b("Manejo Integrado de Plagas")),
                    tags$p("Combinación de control físico, químico y biológico adaptado al contexto.")
                  ),
                  tags$div(
                    style = "flex: 1; text-align: center;",
                    tags$img(src = "monitoreo_icon.png", height = "80px"),
                    tags$p(tags$b("Monitoreo y Detección Temprana")),
                    tags$p("Vigilancia constante en puntos críticos para detectar invasiones tempranas.")
                  )
                ),
                tags$div(
                  style = "display: flex; gap: 20px; width: 100%; justify-content: space-around;",
                  tags$div(
                    style = "flex: 1; text-align: center;",
                    tags$img(src = "comercio_icon.png", height = "80px"),
                    tags$p(tags$b("Regulación del Comercio")),
                    tags$p("Control estricto del comercio de productos de riesgo, como plantas y madera.")
                  ),
                  tags$div(
                    style = "flex: 1; text-align: center;",
                    tags$img(src = "educacion_icon.png", height = "80px"),
                    tags$p(tags$b("Educación y Conciencia Pública")),
                    tags$p("Sensibilización sobre la importancia de las medidas de prevención.")
                  ),
                  tags$div(
                    style = "flex: 1; text-align: center;",
                    tags$img(src = "cebos_icon.png", height = "80px"),
                    tags$p(tags$b("Cebos y Tratamientos")),
                    tags$p("Uso de cebos específicos para control focalizado y seguro.")
                  )
                )
              ),
              h3(""),
              strong("Con un enfoque integrado y la colaboración entre gobiernos, científicos y la sociedad, podemos proteger nuestros ecosistemas y economías. Juntos, podemos marcar la diferencia en la conservación y el futuro de nuestros entornos naturales."),
              h3("")
            )
          )
        )
      )
    )
  ),
  
  tags$style(HTML("
  .content {
    flex: 1;
    padding-bottom: 10px;
  }

  .custom-footer {
    background-color: #f8f9fa;
    color: #000000;
    text-align: center;
    padding: 10px;
    width: 100%;
    border-top: 1px solid #ddd;
  }

  a {
    color: #336699;
    text-decoration: none;
  }

  a:hover {
    text-decoration: underline;
    color: #336699;
  }
")),
  
  div(class = "custom-footer",
      style = "display: flex; flex-direction: column; align-items: center; gap: 5px;",
      HTML(
        "<p style='font-size: 0.9em; line-height: 1em; text-align: center;'> 
      <a href='https://udesa.edu.ar/contarcondatos' target='_blank'>Contar con datos 2024</a> – 
      Desarrollaron la visualización 
      <a href='mailto:andresdevegili@gmail.com'>Andrés Devegili</a> y 
      <a href='mailto:ezepozzi@gmail.com'>Ezequiel Pozzi-Tay</a>
      </p>"
      ),
      
      div(style = "display: flex; align-items: center; justify-content: center; gap: 10px;",
          
          HTML("
               <div style='display: flex; align-items: center;'>
               <img src='shiny.png' alt='Shiny logo' style='height: 20px; margin-right: 5px;'>
               <span style='font-size: 1em;'>
               <a href='https://shiny.posit.co/' target='_blank' style='text-decoration: none; color: #336699;'>Shiny</a>
               </span>
               </div>"
          ),
          
          HTML("
          <a href='https://github.com/tu_usuario/tu_repositorio' target='_blank' style='margin-left: 10px;'>
            <i class='fab fa-github' style='font-size:20px; margin-right:5px;'></i> Nuestros códigos
          </a>"
          ),
          
          actionButton("show_modal", "Bases de datos consultadas", 
                       icon = icon("database"), 
                       class = "btn-primary",
                       style = "transform: scale(0.8);")
      )
  ),
  
  tags$head(
    tags$link(rel = "stylesheet", href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css")
  )
)
