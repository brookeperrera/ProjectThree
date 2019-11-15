#FunctionTwo is plotting locations from functionOne on a map:
install.packages("leaflet")
library(leaflet)
library(dplyr)


levs <- factor(tdf$tag_id) #levs is defined as tag_id in the tdf dataframe
factpal <- colorFactor(topo.colors(90), levs) #factpal is the color palette chosen for this map
map_all <- function(tdf){ 
  all <- tdf %>% 
    group_by(tag_id) %>%
    leaflet() %>% 
    addProviderTiles(providers$Stamen.Toner) %>%  
    addCircleMarkers(~location_long, ~location_lat, color = ~factpal(tag_id), stroke = FALSE, fillOpacity = 0.5)
  return(all)
}
#map_all is a map of all individual turtle locations of the study. Locations are grouped by and color coded by tag_id. 

my_map <- map_all(tdf) #call out the map.
my_map #and view it.
