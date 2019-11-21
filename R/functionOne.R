#'Imports spatial data from 'movebank.org'.
#'
#'Downloads latitude, longitude, animial ID, and other variables associated with "Musk Turtles Kenner LA" study. 
#'
#'@param tdf Identifies study name. 
#'@param movebankLogin A function containing username and password.
#'@return a dataframe of all locaitons from "Musk Turtles Kenner LA" study.
#'@export data_MoveBank


install.packages("move")
library(move)
install.packages(tidyverse)
library(tidyverse)
install.packages("dplyr")
library(dplyr)

tdf <- "Musk Turtles Kenner LA"
movebankLogin <- movebankLogin("brookeperrrera", "MaggieMAE4173!!")

data_MoveBank <- function(tdf, movebankLogin){ 
  dat <- getMovebankData(study = tdf, login = movebankLogin)
  return(dat)
}

df <- data_MoveBank(tdf, movebankLogin = movebankLogin)
tdf <- as_tibble(df)
class(tdf)

write_csv(tdf, "/cloud/project/data/MuskTurtlesKennerLA.csv")