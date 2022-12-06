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
## ---------------------------

# SET WORKING DIRECTORY TO SOURCE FILE LOCATION

# Load the packages

library(palmerpenguins)
library(ggplot2)
library(janitor)
library(dplyr)
library(tidyr)
library(ragg)
library(svglite)

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

# Check the assumptions of the chi squared test by observing the expected frequencies

source('functions/check_expected_frequencies.R')

expected_frequencies_table <- check_expected_frequencies(penguins_subset)

write.table(expected_frequencies_table, "figures/expected_frequency_table.csv")

# Make a plot of the proportions of species on each island as a bar plot

source('functions/plot_bar_chart.R')

penguins_bar_chart <- plot_bar_chart(penguins_subset)

# Save the plot as a png

source('functions/save_plot.R')

save_plot(penguins_subset, "figures/figure_01.png", size = 15, res = 600, scaling = 1)
