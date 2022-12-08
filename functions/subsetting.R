# Subsetting

# Subset the data to only include the penguins that are not NA for the egg laying date and the clutch completion variable

subsetting <- function(data_clean){
  data_clean %>%
    filter(!is.na(island)) %>%
    filter(!is.na(species)) %>%
    select(species, island)
}