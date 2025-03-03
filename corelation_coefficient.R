# --------------------------------------------------------------
# RNA-seq vs qPCR Correlation Analysis
# Author: Utsab Ghimire
# Date: YYYY-MM-DD
# Description:
#   - This script calculates the correlation coefficient 
#     between RNA-seq and qPCR data.
#   - Generates a scatter plot with a trend line.
#   - Saves the output as a high-resolution image.
# --------------------------------------------------------------

# Load required packages
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")
library(ggplot2)

# ------------------- 1. Define Data -------------------
data <- data.frame(
    RNA_seq = c(-2.273, 3.518, 0.613),
    qPCR = c(0.480, 2.340, 1.990),
    Label = c("D7T4M", "D7T4CA", "D7T4E"),
    Color = c("red", "blue", "green")
)

# ------------------- 2. Compute Correlation -------------------
correlation_coefficient <- cor(data$RNA_seq, data$qPCR)

# Print correlation result
print(paste("Pearson correlation coefficient:", round(correlation_coefficient, 2)))

# ------------------- 3. Generate Correlation Plot -------------------
plot <- ggplot(data, aes(x = RNA_seq, y = qPCR, label = Label, color = Label)) +
  geom_point(size = 6) +  # Scatter points
  geom_smooth(method = "lm", se = FALSE, color = "black", linetype = "dashed") +  # Regression line
  labs(
    title = paste("SAG14-LOC106313817 Correlation (r =", round(correlation_coefficient, 2), ")"),
    x = "RNA-seq Log2 Fold Change",
    y = "qPCR Log2 Fold Change"
  ) +
  theme_minimal() +
  theme(
    axis.title = element_text(size = 16, face = "bold"),
    axis.text = element_text(size = 14),
    plot.title = element_text(size = 18, face = "bold"),
    legend.position = "right"
  ) +
  geom_text(aes(label = Label), vjust = -1, size = 5) +  # Labels for points
  scale_color_manual(values = data$Color) +  # Custom colors
  guides(color = guide_legend(title = "Treatments"))

# ------------------- 4. Save the Plot -------------------
output_file <- "plots/RNAseq_vs_qPCR_correlation.jpg"
ggsave(output_file, plot = plot, width = 9, height = 6, dpi = 600)

# Print completion message
print(paste("Plot saved as:", output_file))
