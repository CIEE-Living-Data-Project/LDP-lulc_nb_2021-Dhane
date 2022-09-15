#Load libraries

library(tidyverse)


## Read the data -----------------------------------------------------------


path <- "D:/Documents/LDP/Productivity and Reproducibility/Git/LDP-lulc_nb_2021-Dhane/data"

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

# select tables
Dhane_lulc_classes_code <- data.list$D..Documents.LDP.Productivity.and.Reproducibility.Data_tables_and_maps.Tables.Dhane_lulc_classes_code
Dhane_lulc_year_2000 <- data.list$D..Documents.LDP.Productivity.and.Reproducibility.Data_tables_and_maps.Tables.Dhane_lulc_year_2000
Dhane_lulc_year_2020 <- data.list$D..Documents.LDP.Productivity.and.Reproducibility.Data_tables_and_maps.Tables.Dhane_lulc_year_2020
Dhane_metadata <- data.list$D..Documents.LDP.Productivity.and.Reproducibility.Data_tables_and_maps.Tables.Dhane_metadata



## Analyze the data --------------------------------------------------------

# script to come #