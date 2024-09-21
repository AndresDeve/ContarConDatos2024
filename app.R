######### RECORDAR GUARDAR ANTES DE DESPLEGAR AL SERVIDOR

#setwd("~/Desktop/ShinyApp/HormigaARG")
#rsconnect::deployApp("~/Desktop/ShinyApp/HormigaARG")

# app.R

# Cargar los módulos UI, Server y Global
source("global.R")
source("ui.R")
source("server.R")

# Ejecuta la aplicación Shiny
shinyApp(ui = ui, server = server)