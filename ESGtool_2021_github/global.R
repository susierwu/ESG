library(dplyr)
library(dbplyr)
library(data.table)
library(reshape2)
library(tidyr)
library(lubridate)
library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(rgeos)
library(shinycssloaders)
library(ggthemes)
library(RColorBrewer)
library(sf)
library(sp)
library(ggrepel)
library(leaflet)
library(plotly)
library(highcharter)
library(shinyMatrix)
library(ggplot2)
library(waffle)
library(extrafont)
library(scales)
library(extrafontdb)
library(airportr)
library(shinyFiles)
library(shinyjs)
library(DT)
library(berryFunctions)
library(leaflet)
library(spData)
library(maps)
library(mapproj)
library(rworldmap)




##------load data
KJ2kwh = 0.0002777778

wmap <- rworldmap::getMap(resolution="coarse")

##------layout functions
source("functions/utils.R")
source("functions/suppmap.R")
cores <- c( "#8db600","#e96449","#fdc23a", "#7d7da9")


##----- header shiny ----
tab_files <- list.files(path = "tabs", full.names = T, recursive = T)
tab_files <- tab_files[-grep(x = tab_files, pattern = "server")]
suppressMessages(lapply(tab_files, source))

