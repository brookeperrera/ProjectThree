#'Imports movement data from 'movebank.org'.
#'
#'Downloads latitude, longitude, animial ID, and other variables associated with "Musk Turtles Kenner LA" study. 
#'
#'@param tdf Identifies study name. 
#'@param movebankLogin A function containing username and password.
#'@return data from "Musk Turtles Kenner LA" study.
#'@export data_MoveBank


#The package "move" contains functions to access movement data stored in 'movebank.org' an online data storage resource. This package also allows you to visualize and analyze movement data.  
install.packages("move")
library(move)
install.packages(tidyverse)
library(tidyverse)
install.packages("dplyr")
library(dplyr)

#tdf will be assigned as "Musk Turtles Kenner LA"
tdf <- "Musk Turtles Kenner LA"
movebankLogin <- movebankLogin("brookeperrrera", "MaggieMAE4173!!")

#data_MoveBank is a function that will download all data on MoveBank associated with the study "Musk Turtles Kenner LA"
data_MoveBank <- function(tdf, movebankLogin){ 
  dat <- getMovebankData(study = tdf, login = movebankLogin)
  return(dat)
}

#df is a MoveStack, or a stack of move objects. To extract the spatial dataframe from this MoveStack, I assigned 'tdf' as a dataframe of 'df'.
df <- data_MoveBank(tdf, movebankLogin = movebankLogin)
tdf <- as_tibble(df)
class(tdf)

#save data to the 'data' file as a .csv
write_csv(tdf, "/cloud/project/data/MuskTurtlesKennerLA.csv")