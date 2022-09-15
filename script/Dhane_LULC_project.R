# Load libraries
library(tidyverse)

# Create folders
dir.create("data/") #create data folder
dir.create("script/") #Create script folder

# Upload data from local drive
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

# select tables
Dhane_lulc_classes_code <- data.list$D..Documents.LDP.Productivity.and.Reproducibility.Data_tables_and_maps.Tables.Dhane_lulc_classes_code
Dhane_lulc_year_2000 <- data.list$D..Documents.LDP.Productivity.and.Reproducibility.Data_tables_and_maps.Tables.Dhane_lulc_year_2000
Dhane_lulc_year_2020 <- data.list$D..Documents.LDP.Productivity.and.Reproducibility.Data_tables_and_maps.Tables.Dhane_lulc_year_2020
Dhane_metadata <- data.list$D..Documents.LDP.Productivity.and.Reproducibility.Data_tables_and_maps.Tables.Dhane_metadata

# list tables
myList <- list(Dhane_lulc_classes_code = Dhane_lulc_classes_code, 
               Dhane_lulc_year_2000 = Dhane_lulc_year_2000,
               Dhane_lulc_year_2020 = Dhane_lulc_year_2020,
               Dhane_metadata = Dhane_metadata)

# Set path
path.out <- "D:/Documents/LDP/Productivity and Reproducibility/Git/LDP-lulc_nb_2021-Dhane/data"
setwd(path.out)

# Save 
for(i in names(myList)){
  write.csv(myList[[i]], paste0(i,".csv"))
}

#Read data from Git "data folder"
