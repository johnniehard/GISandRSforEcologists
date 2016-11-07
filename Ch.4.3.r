
## Plot spatial data

library(raster)
library(rgdal)

#import raster
allBands <- list.files("raster_data/LT52240632011210", pattern = "TIF", full.names = TRUE)
p224r63_2011 <- stack(allBands)
names(p224r63_2011) <- gsub(pattern = "LT52240632011210CUB01_", replace = "", x = names(p224r63_2011))


# plot all bands separately
plot(p224r63_2011)
# plot only fifth layer
plot(p224r63_2011, 5)
# change the color palette
plot(p224r63_2011, 5, col = grey.colors(100))
