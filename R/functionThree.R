#FunctionThree will map only radio-tracked individuals with relocations of >2. First, we select turtles from 'tdf' that have more than 2 relocations.
library(leaflet)
library(dplyr)

nlocs <- tdf %>% 
  select(tag_id, timestamp, location_lat, location_long) %>%
  group_by(tag_id) %>%
  summarize(n()) %>% 
  mutate(n = n()) %>% 
#'nlocs' provides a list of individuals with more that 2 relocations. 'rt' contains the locations of 9 individuals with more than 2 locations.

rt <- filter(tdf, tag_local_identifier == c(1, 4, 8, 23, 25, 31, 35, 89, 93))

levs <- factor(tdf$tag_local_identifier) #levs is defined as tag_id in the tdf dataframe
factpal <- colorFactor(topo.colors(90), levs) #factpal is the color palette chosen for this map

map_rt <- function(rt){ 
    all <- rt %>% 
    group_by(tag_local_identifier) %>%
    leaflet() %>% 
    addProviderTiles(providers$Stamen.Toner) %>%  
    addCircleMarkers(~location_long, ~location_lat, color = ~factpal(tag_local_identifier), stroke = FALSE, fillOpacity = 0.5)
    return(all)
}

#function(rt) maps 9 radio-tracked turtles. 
rt_map <- map_rt(rt)
rt_map


