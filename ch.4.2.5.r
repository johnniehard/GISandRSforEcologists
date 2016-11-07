
## Import vector

library(rgdal)
studyArea <- readOGR("vector_data", "study_area_UTMnorth")
plot(studyArea)

pa <- readOGR("vector_data", "PAs_UNEP_WCMC_p224r63")
plot(pa, add = TRUE)

roads <- readOGR("vector_data", "roads_p224r63_UTMsouth")
plot(roads)


gpsPoints <- readOGR(dsn = "vector_data/field_measurements.gpx", layer = "waypoints")


## CSV data
csv_file <- read.csv("vector_data/csv_file_locationdata.csv")

csv.sp <- SpatialPoints(coords = csv_file[, c("X", "Y")])
csv.spdf <- SpatialPointsDataFrame(csv_file[, c("X", "Y")], data = csv_file[3:5])
csv.spdf

# CSV data, right way>>>
coordinates(csv_file) <- c("X", "Y")
class(csv_file)
projection(csv_file) <- projection(p224r63_2011)

plot(allBands)
plot(csv_file)



## Extent
# s.75

ex <- extent(p224r63_2011)
ex


