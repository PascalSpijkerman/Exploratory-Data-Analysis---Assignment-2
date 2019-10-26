## Exploratory Data Analysis - Week 4 - Project 2 - Pascal Spijkerman

# Plot 2
library(data.table)
library(ggplot2)

NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

subsetNEI  <- NEI[NEI$fips=="24510", ]

##Checking variables of both files 
names(NEI)
names(SCC)

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png('plot2.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()