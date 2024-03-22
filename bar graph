# Create a data frame from the given data
data <- data.frame(
  Treatment = c("D7T4M", "D7T10M", "D14T4E", "D14T10E"),
  FoldChange = c(2.203139515, 4.404667725, -2.98908747, -4.094857433)
)

# Create a vector to specify colors (green for "M" and red for "E")
bar_colors <- ifelse(grepl("M", data$Treatment), "green", "red")

# Create the bar plot with elongated y-axis
bp <- barplot(data$FoldChange, col = bar_colors, names.arg = data$Treatment,
              main = "GH3.17-like", xlab = "Treatment", ylab = "Fold Change",
              ylim = range(data$FoldChange) + c(-1, 1))

# Add error bars
# Define error values
errors <- c(0.28, 0.07, 0.16, 0.13)

# Add error bars to the plot
for (i in 1:length(data$FoldChange)) {
  arrows(x0 = bp[i], y0 = data$FoldChange[i] - errors[i],
         x1 = bp[i], y1 = data$FoldChange[i] + errors[i],
         angle = 90, code = 3, length = 0.05)
}
