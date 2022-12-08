# Save plot

# Save the bar chart as a png file in the figures folder

save_plot <- function(figure, filename, size, res, scaling){
  agg_png(filename, width = size, 
          height = size, 
          units = "cm", 
          res = res, 
          scaling = scaling)
  penguins_bar_chart <- plot_bar_chart(penguins_subset)
  print(penguins_bar_chart)
  dev.off()
}
