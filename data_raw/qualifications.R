# ---- Load packages ----
library(openxlsx)
library(tidyverse)
library(dplyr)

# ---- Load data ---- 
qualifications <- read.xlsx("downloaded_datasets/qualifications 2021census.xlsx", sheet = "Qualifications (Constituency)")

# ---- Clean dataset ----
# Create an ordered factor variable
qualifications$Qualification_numeric <- dplyr::recode(qualifications$Qualification,
                                                      "No qualifications" = 1,
                                                      "1 to 4 GCSE passes" = 2,   # Level 1
                                                      "5 or more GCSE passes" = 3, # Level 2
                                                      "Apprenticeship" = 4,
                                                      "2 or more A levels" = 5,    # Level 3
                                                      "Higher education qualifications" = 6,  # Level 4 or above
                                                      "Other qualifications" = NA_real_  # Unknown level
)

# Convert to numeric
qualifications$Qualification_numeric <- as.numeric(as.character(qualifications$Qualification_numeric))
