library(icesTAF)
library(sf)

download(
  "https://gis.ices.dk/shapefiles/OSPAR_Subregions.zip"
)

unzip("OSPAR_Subregions.zip")
unlink("OSPAR_Subregions.zip")

areas <- st_read("OSPAR_subregions_20160418_3857.shp")

# write as csv
st_write(
  areas, "ospar-areas.csv",
  layer_options = "GEOMETRY=AS_WKT"
)

unlink(dir(pattern = "OSPAR_subregions_20160418_3857"))

draft.data(
  data.files = NULL,
  data.scripts = "ospar-areas.R",
  originator = "OSPAR",
  title = "OSPAR areas",
  file = TRUE,
  append = TRUE
)
