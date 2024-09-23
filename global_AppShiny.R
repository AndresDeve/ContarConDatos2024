library(shiny)
library(leaflet)
library(dplyr)
library(readr)
library(plotly)
library(ggplot2)
library(scales)

img_data <- base64enc::dataURI(file = "comparacion_hormARG.png", mime = "image/png")
img_data2 <- base64enc::dataURI(file = "castas_supercolonias.png", mime = "image/png")
img_data.seq1 <- base64enc::dataURI(file = "seq1.png", mime = "image/png")
img_data.seq2 <- base64enc::dataURI(file = "seq2.png", mime = "image/png")
img_data.seq3 <- base64enc::dataURI(file = "seq3.png", mime = "image/png")

hormigaARG <- read_delim("hormigaARG.txt", "\t", escape_double = FALSE, trim_ws = TRUE)
combined_df <- read_csv("combined_df.csv", trim_ws = TRUE)

hormigaARG_filtered <- hormigaARG %>%
  filter(!is.na(LocLatitude) & !is.na(LocLongitude) & !is.na(DateCollectedStart))

hormigaARG_filtered$DateCollectedStart <- as.Date(hormigaARG_filtered$DateCollectedStart)
hormigaARG_filtered$YearCollected <- as.integer(format(hormigaARG_filtered$DateCollectedStart, "%Y"))

cumulative_data_df <- hormigaARG_filtered %>%
  group_by(YearCollected) %>%
  mutate(YearFrame = as.character(YearCollected)) %>%
  ungroup() %>%
  arrange(YearCollected)

impacto_economico <- read_delim("impacto_economico.txt", "\t", escape_double = FALSE, trim_ws = TRUE)

data <- read.table("~/Desktop/ShinyApp/HormigaARG/grafico_arbol.txt", header = TRUE, sep = "\t")

data_habitat <- data %>%
  count(Habitat) %>%
  mutate(percentage = n / sum(n) * 100)

data_cost <- data %>%
  count(Type_of_cost) %>%
  mutate(percentage = n / sum(n) * 100)
