# Install Packages will used form Cran

# GIS
gis  <- c("rgdal","GISTools",)
proj <- c("proj4")
# Geostatics
gstat  <- c("sp","spatial", "gstat", "geoR", "SpatialTools", "spatial", "spacetime")
install.packages("gstat")
# Mapping
MappingTools  <- c("maptools", "gmt", "ggmap")
install.packages(MappingTools)
# Ploting
plot  <- c("ggplot2", "lattice", "rgl")

getMODIS
install.packages(plot)
# Remote Sensing
RS  <- c("getMODIS","landsat", "rgdal", "raster", "image")
install.packages(RS)
install.packages("MODIS", repos="")

# Web Scraping
web <- c("Rcurl", "XML", "scrapR")
install.packages(web)
