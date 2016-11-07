
#importing raster data
# s.66

# a single band
p224r63_2011_B1 <- raster("raster_data/LT52240632011210/LT52240632011210CUB01_B1.TIF")



# all bands

allBands <- list.files("raster_data/LT52240632011210", pattern = "TIF", full.names = TRUE)
p224r63_2011 <- stack(allBands)

# remove scene ID from band names
names(p224r63_2011) <- gsub(pattern = "LT52240632011210CUB01_", replace = "", x = names(p224r63_2011))


# save as a single multi band GeoTIFF
writeRaster(p224r63_2011, filename = "raster_data/LT52240632011210.tif")


# convert to SpatialPixelsDataFrame
p224r63_2011_sp <- as(p224r63_2011, "SpatialPixelsDataFrame")
class(p224r63_2011_sp)

# convert sp to brick
p224r63_2011_ras <- as(p224r63_2011_sp, "RasterBrick")
plot(p224r63_2011)

p224r63_2011_ras < writeRaster(p224r63_2011_ras, filename = "raster_data/p224r63.tif")
