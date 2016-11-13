
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
# 50% transparency
plot(p224r63_2011, 5, alpha = 0.5)
# alternative
image(p224r63_2011, 5)

## maxpixels
plot(p224r63_2011, 5, maxpixels = 2e+05)

# ggplot2 with RSToolbox wrapper
library(RStoolbox)
library(ggplot2) ## did not say in the book that this needed importing
ggR(p224r63_2011, 5)
ggR(p224r63_2011, 5, geom_raster = TRUE)
ggR(p224r63_2011, 5, geom_raster = TRUE) +
  scale_fill_gradientn(colours = rainbow(100))



### plot RGB
plotRGB(p224r63_2011, r = 4, g = 3, b = 2, stretch = "lin")

ggRGB(p224r63_2011, r = 4, g = 3, b = 2, stretch = "lin")




## combining with vector layers
csv_file <- read.csv("vector_data/csv_file_locationdata.csv")
csv.spdf <- SpatialPointsDataFrame(csv_file[, c("X", "Y")], data = csv_file[3:5])
studyArea <- readOGR("vector_data", "study_area_UTMnorth")


plot(p224r63_2011, 5)
points(csv.spdf, col = "blue")
plot(studyArea, add = TRUE, lwd = 10)


## with ggplot2 wrapper
df_pts <- as.data.frame(csv.spdf)
df_poly <- fortify(studyArea)

df_ras <- as.data.frame(p224r63_2011, xy = TRUE)
## or
df_ras <- fortify(p224r63_2011, maxpixels = 1e+05)

ggRGB(p224r63_2011, 4, 3, 2, stretch = "lin") +
  geom_point(data = df_pts, aes(x = X, y = Y), size = 5, col = "yellow") +
  geom_path(data = df_poly, aes(x = long, y = lat, group = group), size = 2, col = "blue") +
  coord_equal()