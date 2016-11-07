
# p.47


library(rgdal)
studyarea <- readOGR("vector_data/", "study_area_ll")

#list.files('~/R/funwithR/data/ne_110m_land', pattern='\\.shp$')
#file.exists('~/R/funwithR/data/ne_110m_land/ne_110m_land.shp')

list.files('vector_data/', pattern= '\\.shp$')

library(wrspathrow)
pathrowSA <- pathrow_num(studyarea)