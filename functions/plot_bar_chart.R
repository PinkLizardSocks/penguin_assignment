# Plot_bar_chart

# Plot the bar chart showing the proportion of each penguin species on each island 

plot_bar_chart <- function(data){
  data %>% 
    ggplot(aes(x = island, fill = species)) +
    geom_bar(position = 'fill') +
    labs(x = 'Island', y = 'Species Proportions', fill = 'Species') +
    scale_fill_manual(values = c("darkorange","purple","cyan4"), labels = c("Adelie", "Chinstrap", "Gintoo")) +
    theme_bw() 
}