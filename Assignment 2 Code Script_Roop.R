library(ggplot)
library(gridExtra)
library(reshape2)
library(tidyr)
library(chron)
library(dplyr)
library(zoo)
library(ggpubr)

#Select directory for files 
folder <- "/Users/spenc/Documents/Docs/Dissertation & Research/Dissertation Proposal/Research Data/Summer 2019" 

# Filenames of .csv files in the data folder 
Master_files <- list.files(folder, pattern = ".csv")

#Data frame for combined data 
Master_Data <- NULL

#Loop to load data from each file and combine into the master data fram e
for(i in 1:length(Master_files)){
	D.2019 <- read.csv("Summer 2019 Data Analysis.csv")
	C.2019 <- read.csv("Climate Table.csv")
}

#Column bind the dataframe together 
Data_all <- cbind(D.2019, C.2019)

#Filename 
Summer_2019 <- paste0(strsplit(Master_files[i],"_")[[1]][1],"_complied.csv")

#Export csv of data 
write.csv(Data_all, paste0(folder, Summer_2019))

#Combine into master dataframe 
Master_Data <- rbind(Master_Data, Data_all)

#Delete unwanted columns 
Master_Data2 <- Master_Data %>% 
	select(1, 3, 4, 5, 6, 7, 8, 9, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44)
	
#Plot 
ggplot(Master_Data2, aes(gsp, E, colour = State)) + 
	geom_point()
