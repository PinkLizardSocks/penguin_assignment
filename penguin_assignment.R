##
## Script name: penguin_assignment.r
##
## Purpose of script: 
##      Loads penguin data, cleans it, runs a chi squared test of independence 
##      for species and island, plots the results, and saves the plot to a file
##
## Date Created: 2022-12-05
##
## Notes: 
##        
##   
##
## ---------------------------

# Load the packages

library(palmerpenguins)
library(ggplot2)
library(janitor)
library(dplyr)
library(tidyr)
library(ragg)
library(svglite)
library(rstudioapi)

# Set working directory to source file location 

setwd(dirname(getActiveDocumentContext()$path))  

# Load the raw data 

penguins_raw <- read.csv("data_raw/penguins_raw.csv")

# Clean the data

source('functions/cleaning.R')

penguins_clean <- cleaning(penguins_raw)

# Save the cleaned data

write.csv(penguins_clean, "data_clean/penguins_clean.csv")

# Subset the data to remove penguins with NA island or species

source('functions/subsetting.R')

penguins_subset <- subsetting(penguins_clean)

# Run a chi-squared test on the data

chisq.test(penguins_subset$species, penguins_subset$island)

# The results are a X-squared value of 299.55 with 4 df and a p value < 2.2e-16
# This strongly indicates that island and species are not independent 
# The proportions of penguins on each island are significantly different 

# Check the assumptions of the chi squared test by observing the expected frequencies

source('functions/check_expected_frequencies.R')

expected_frequencies_table <- check_expected_frequencies(penguins_subset)

write.csv(expected_frequencies_table, "figures/expected_frequency_table.csv")

# The resulting table found in the figures file shows that each expected 
# frequency is greater than 5 so this assumption is not violated. 
# Other assumptions of independence, categorical variables, and mutually 
# exclusive categories are also met. 

# Make a plot of the proportions of species on each island as a bar plot

source('functions/plot_bar_chart.R')

penguins_bar_chart <- plot_bar_chart(penguins_subset)

# Save the plot as a png

source('functions/save_plot.R')

save_plot(penguins_subset, "figures/figure_01.png", size = 15, res = 600, scaling = 1)

