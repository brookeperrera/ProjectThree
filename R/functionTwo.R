#'Maps spatial data from 'movebank.org'.
#'
#'Maps spatial data that is grouped by animial ID from "Musk Turtles Kenner LA" study. 
#'
#'@param tdf Identifies study name. 
#'@return a map of all locaitons from "Musk Turtles Kenner LA" study.
#'@export map_all

install.packages("leaflet")
library(leaflet)
library(dplyr)

levs <- factor(tdf$tag_id) 
factpal <- colorFactor(topo.colors(90), levs) 
map_all <- function(tdf){ 
  all <- tdf %>% 
    group_by(tag_id) %>%
    leaflet() %>% 
    addProviderTiles(providers$Stamen.Toner) %>%  
    addCircleMarkers(~location_long, ~location_lat, color = ~factpal(tag_id), stroke = FALSE, fillOpacity = 0.5)
  return(all)
}

my_map <- map_all(tdf)
my_map
