#############################

# 01. Setup

#############################

# Setup data handling ----------------------------------------------------------
## Custom install & load function (From OS Course, Erik Kusch)
install.load.package <- function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, repos = "http://cran.us.r-project.org")
  }
  require(x, character.only = TRUE)
}
## names of packages we want installed (if not installed yet) and loaded
package_vec <- c(
  "here", # package for locating and storing files with relative paths
  "dplyr", # data manipulation
  "knitr", # for rmarkdown table visualisations
  "ggplot2", # for visualistion
  "ggpubr", # publication ready plots
  "report", # for citing packages including versions
  "stringr", # for string operations
  "readxl", # read excel files
  "writexl", # write excel files
  "rgbif" # An interface to the GBIF API for the R statistical programming environment
)
## executing install & load for each package
sapply(package_vec, install.load.package)
