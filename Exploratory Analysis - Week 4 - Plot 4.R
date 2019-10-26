## Exploratory Data Analysis - Week 4 - Project 2 - Pascal Spijkerman - Plot 4

library(ggplot2)

NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

##Checking variables of both files 
names(NEI)
names(SCC)

## Use 24510 for Baltimore City