# Load libraries
library(tidyverse)

# Create folders
dir.create("data/") #create data folder
dir.create("script/") #Create script folder

#Upload data from local drive
data.path <- "D:/Documents/LDP/Productivity and Reproducibility/Data_tables_and_maps/Tables/"
myfiles <- list.files(path = data.path, pattern = "*.csv", full.names = TRUE)

# import all tables as separate data frames, remove file path and file extensions (.csv)
data.list <- list2env(
  lapply(
    setNames(myfiles, 
             make.names(
               gsub(".*1_", "", 
                    tools::file_path_sans_ext(myfiles)))), 
    read_csv), 
  envir = .GlobalEnv)

#select tables
