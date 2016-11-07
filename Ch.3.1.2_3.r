
library(RStoolbox)

zipfiles <- list.files(path = "raster_data/EarthExplorer", pattern = ".zip", full.names = TRUE)

eeResults <- lapply(zipfiles, unzip, exdir = "raster_data/EarthExplorer")

eeResults <- readEE(eeResults)


## plot availability
library(ggplot2)
ggplot(subset(eeResults, Year < 2015 & Cloud.Cover < 20)) +
  geom_tile(aes(x = Doy, y = Year, alpha = Cloud.Cover, fill = Satellite), width = 2, size = 2) +
  scale_y_continuous(breaks = c(1984:2014)) +
  scale_alpha_continuous(name = "Cloud Cover (%)", range = c(1, 0.5))