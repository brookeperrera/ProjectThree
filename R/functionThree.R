#'Maps spatial data from 'movebank.org' of a subset of individuals.
#'
#'Maps spatial data that is grouped by animial ID of nine individuals with more than two relocations from "Musk Turtles Kenner LA" study. 
#'
#'@param rt Identifies study name. 
#'@return a map of locations of nine individuals from "Musk Turtles Kenner LA" study.
#'@export map_rt

library(leaflet)
library(dplyr)

nlocs <- tdf %>% 
  select(tag_id, timestamp, location_lat, location_long) %>%
  group_by(tag_id) %>%
  summarize(n()) %>% 
  mutate(n = n()) %>% 

rt <- filter(tdf, tag_local_identifier == c(1, 4, 8, 23, 25, 31, 35, 89, 93))

levs <- factor(tdf$tag_local_identifier) 
factpal <- colorFactor(topo.colors(90), levs) 

map_rt <- function(rt){ 
    all <- rt %>% 
    group_by(tag_local_identifier) %>%
    leaflet() %>% 
    addProviderTiles(providers$Stamen.Toner) %>%  
    addCircleMarkers(~location_long, ~location_lat, color = ~factpal(tag_local_identifier), stroke = FALSE, fillOpacity = 0.5)
    return(all)
}

rt_map <- map_rt(rt)
rt_map


