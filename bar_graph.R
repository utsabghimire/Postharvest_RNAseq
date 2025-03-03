# --------------------------------------------------------------
# RNA-seq Bar Graphs with Error Bars
# Author: Utsab Ghimire
# Date: YYYY-MM-DD
# Description:
#   - This script generates bar graphs for fold changes
#   - Uses error bars for visualization
#   - Saves output as PNG images
# --------------------------------------------------------------

# Load required packages
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")
library(ggplot2)

# Function to create and save a bar graph
plot_bar_graph <- function(data, title, output_file) {
  p <- ggplot(data, aes(x = Treatment, y = FoldChange, fill = Treatment)) +
    geom_bar(stat = "identity", position = position_dodge(), color = "black") +
    geom_errorbar(aes(ymin = FoldChange - Error, ymax = FoldChange + Error),
                  width = 0.2, position = position_dodge(0.9)) +
    scale_fill_manual(values = ifelse(grepl("M", data$Treatment), "green", "red")) +
    labs(title = title, x = "Treatment", y = "Fold Change") +
    theme_minimal()

  # Save the plot as a PNG file
  ggsave(output_file, p, width = 6, height = 4)
}

# Example datasets
data_list <- list(
  data.frame(Treatment = c("D7T4M", "D7T10M", "D14T4E", "D14T10E"),
             FoldChange = c(2.20, 4.40, -2.98, -4.09),
             Error = c(0.28, 0.07, 0.16, 0.13)),
  
  data.frame(Treatment = c("D7T10M", "D7T4M", "D14T4E", "D14T10E"),
             FoldChange = c(-2.29, -1.58, 3.39, 6.13),
             Error = c(0.01, 0.01, 0.18, 0.08))
)

# Titles and output filenames
titles <- c("GH3.17-like", "Polygalacturonase QRT2-like")
output_files <- c("plots/GH3_barplot.png", "plots/Polygalacturonase_barplot.png")

# Loop through datasets and create plots
for (i in seq_along(data_list)) {
  plot_bar_graph(data_list[[i]], titles[i], output_files[i])
}

print("Plots saved successfully in the 'plots/' directory.")
