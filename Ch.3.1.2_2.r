
# p.47


library(rgdal)
studyarea <- readOGR("vector_data", "study_area_ll")

library(wrspathrow)
pathrowSA <- pathrow_num(studyarea)

pathrowSAsp <- pathrow_num(studyarea, as_polys = TRUE)
plot(pathrowSAsp)
plot(studyarea, add = TRUE)