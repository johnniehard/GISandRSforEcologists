
library(osmar)
studyArea_bb <- center_bbox(-49.75, -4.72, 30000, 30000)
OSMdata <- get_osm(studyArea_bb, source = osmsource_api())
plot(OSMdata)