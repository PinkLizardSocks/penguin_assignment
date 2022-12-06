# Check expected frequencies

# Check the expected frequencies of the data for the chi squared test 

check_expected_frequencies <- function(data){
  
  by_species <- count(data, species) %>%
    
    mutate(proportion = n / 334)
  
  by_island <- count(data, island) %>%
    
    mutate(proportion = n / 334)
  
  total <- nrow(data)
  
  expected_proportions <- matrix(1:9, nrow = 3)
  
  for (i in 1:3){
    
    for (j in 1:3){
      
      expected_proportions[i,j] <- by_species$proportion[i] * by_island$proportion[j]
      
    }
  }
  
  expected_frequencies <- expected_proportions * total
  
  return(expected_frequencies)
}
