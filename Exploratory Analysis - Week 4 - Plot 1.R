## Exploratory Data Analysis - Week 4 - Project 2 - Pascal Spijkerman

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

library(data.table)
library(ggplot2)

NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

##Checking variables of both files 
names(NEI)
names(SCC)

## Analysis to be performed
Analysis <- aggregate(Emissions ~ year, NEI, sum)


##Plotting
png('plot1.png')
barplot(height=Analysis$Emissions, names.arg=Analysis$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()






