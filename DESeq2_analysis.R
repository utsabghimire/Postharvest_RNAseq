# --------------------------------------------------------------
# Differential Expression Analysis Using DESeq2
# Author: Utsab Ghimire
# Date: YYYY-MM-DD
# Description:
#   - This script performs RNA-seq differential expression analysis
#     using DESeq2.
#   - It assumes a count matrix with gene names as row names and 
#     3 replicates each for control and treatment.
#   - Outputs include differential expression results in text and Excel formats.
# --------------------------------------------------------------

# ------------------- 1. Install & Load Required Libraries -------------------
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
if (!requireNamespace("DESeq2", quietly = TRUE)) BiocManager::install("DESeq2")
if (!requireNamespace("openxlsx", quietly = TRUE)) install.packages("openxlsx")

# Load Libraries
library(DESeq2)
library(openxlsx)

# ------------------- 2. Load the Count Data -------------------
# Specify the file name (Modify path if needed)
file_path <- "dummy_rna_seq.txt"

# Check if the file exists before reading
if (!file.exists(file_path)) {
  stop("Error: File not found. Please check the file path.")
}

# Read count matrix (tab-separated file)
countData <- read.table(file_path, header = TRUE, row.names = 1, sep = "\t")

# Verify data structure
print(dim(countData))   # Check matrix dimensions
print(head(countData))  # Display first few rows

# ------------------- 3. Create Experimental Design -------------------
# Define sample conditions (Modify if needed)
sample_conditions <- c(rep("control", 3), rep("treatment", 3))
colData <- data.frame(condition = factor(sample_conditions), row.names = colnames(countData))

# Verify the design matrix
print(colData)

# ------------------- 4. Run DESeq2 Analysis -------------------
# Create DESeq2 dataset
dds <- DESeqDataSetFromMatrix(countData = countData, colData = colData, design = ~ condition)

# Run DESeq2 pipeline
dds <- DESeq(dds)

# Get differential expression results
res <- results(dds)

# Print summary of results
summary(res)

# ------------------- 5. Save & Export Results -------------------
# Convert results to a data frame
res_df <- as.data.frame(res)

# Save results as a tab-separated text file
write.table(res_df, file = "deseq2_results.txt", sep = "\t", row.names = TRUE, quote = FALSE)

# Save results in Excel format
write.xlsx(res_df, file = "deseq2_results.xlsx", rowNames = TRUE)

# ------------------- 6. Download Results (If Running in an Interactive Session) -------------------
# If using an interactive session, uncomment the following line to download the file:
# download.file("deseq2_results.txt", destfile = "deseq2_results.txt")

# ------------------- END OF SCRIPT -------------------
