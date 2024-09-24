#### Preamble ####
# Purpose: Downloads and saves the data from opendatatoronto
# Author: Fangning Zhang
# Date: 23 September 2024
# Contact: fangning.zhang@mail.utoronto.ca 
# License: MIT
# Pre-requisites: none
# Any other information needed? none


library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("deaths-of-shelter-residents")
package

# get all resources for this package
resources <- list_package_resources("deaths-of-shelter-residents")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data
# save data
write_csv(data, "data1/raw_data/raw_data.csv")


