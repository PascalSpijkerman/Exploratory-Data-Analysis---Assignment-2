## Exploratory Data Analysis - Week 4 - Project 2 - Pascal Spijkerman - Plot 5

library(ggplot2)
library(data.table)

NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

NEI_SCC_data <- merge(NEI, SCC,  by="SCC")

##Checking variables of both files 
names(NEI)
names(SCC)

## Baltimore city data
df <- data.table(NEI)

# filter dataset to only include Baltimore with type equal to 'ON-ROAD'
subsetNEI <- subset(df, fips == '24510' & type == 'ON-ROAD')

png("plot5.png")

by_year <- subsetNEI[, list(emissions=sum(Emissions)), by=c('year', 'type')]
by_year$year = as.numeric(as.character(by_year$year))
by_year$emissions = as.numeric(as.character(by_year$emissions))

ggplot(data=by_year, aes(x=year, y=emissions)) + geom_line() + geom_point() + ggtitle("Emissions in Baltimore City from Motor Vehicles")

dev.off()