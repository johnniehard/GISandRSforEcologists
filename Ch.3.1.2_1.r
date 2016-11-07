
#p. 45

library(raster)

#download global administrative data (http://gadm.org/)
brazil <- getData("GADM", country = "BRA", level = 1)
plot(brazil)

x <- getData("ISO3")
x[x[, "NAME"] == "South Africa", ]



#download WorldClim raster data
prec <- getData("worldclim", var = "prec", res = 2.5)
names(prec) <- c("Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec")
plot(prec)
plot(prec, 1)
