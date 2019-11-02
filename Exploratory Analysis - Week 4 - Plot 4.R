## Exploratory Data Analysis - Week 4 - Project 2 - Pascal Spijkerman - Plot 4

library(ggplot2)

NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

NEI_SCC_data <- merge(NEI, SCC,  by="SCC")

##Checking variables of both files 
names(NEI)
names(SCC)

coal_bol <- grepl("coal",NEI_SCC_data$EI.Sector, ignore.case = TRUE)
coal_subset <- NEI_SCC_data[coal_bol, ]
comb_bol <- grepl("comb", coal_subset$EI.Sector, ignore.case = TRUE)
coal_comb_subset <- coal_subset[comb_bol, ]

png("plot4.png", width = 480, height = 480)

plot4 <- ggplot(coal_comb_subset, aes(factor(year), Emissions/1000)) +
  geom_bar(stat = "identity", fill = "deepskyblue4", show.legend = FALSE) + labs(x = "Year") + labs(y = expression(paste(PM[2.5], " Emissions (",10^3," tons)"))) +
  labs(title = "Total Coal Combustion Emissions for the USA")

print(plot4)

dev.off()