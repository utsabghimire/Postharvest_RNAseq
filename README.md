# **RNA-seq Differential Expression Analysis Using DESeq2** 🎯🧬

## **📌 Overview**
This repository contains an **RNA-seq analysis pipeline** using **DESeq2** for differential expression analysis between control and treatment conditions. The script processes raw count data, performs normalization, statistical testing, and outputs differentially expressed genes.

## **📂 Files in This Repository**
- **`DESeq2_analysis.R`** – The main script for RNA-seq differential expression analysis.
- **`dummy_rna_seq.txt`** – Sample input count matrix (gene expression data).
- **`deseq2_results.txt`** – Output file with differentially expressed genes (tab-separated).
- **`deseq2_results.xlsx`** – Output file in Excel format for easy visualization.

## **🛠 Requirements**
Before running the script, install the required packages in R:
```r
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
BiocManager::install("DESeq2")
install.packages("openxlsx")  # For exporting results to Excel
🔬 Data Format

The input count matrix should be a tab-separated file with the following format:

Gene_name	Control_1	Control_2	Control_3	Treatment_1	Treatment_2	Treatment_3
GeneA	100	120	130	200	250	270
GeneB	50	55	60	80	90	85
The first column contains gene names.
The next columns contain raw read counts for each replicate
🚀 How to Run the Analysis

Clone the repository:
git clone https://github.com/your-username/RNAseq_DESeq2_Analysis.git
cd RNAseq_DESeq2_Analysis
Open DESeq2_analysis.R in RStudio and modify the input file path if necessary:
file_path <- "dummy_rna_seq.txt"  # Update if using a different file
Run the script in R:
source("DESeq2_analysis.R")
Output files:
deseq2_results.txt → Tab-separated results.
deseq2_results.xlsx → Excel file for easy review.
📊 Understanding the Output

The output file contains key statistical values:

Gene	log2FoldChange	p-value	padj
GeneA	1.52	0.002	0.005
GeneB	-0.87	0.01	0.02
log2FoldChange: Positive = Upregulated, Negative = Downregulated.
p-value: Statistical significance of differential expression.
padj: Adjusted p-value (FDR correction).

Bar Graphs
Generate bar graphs from RNA-seq data:
source("scripts/bar_graphs.R")
The plots are saved in the plots/ folder.

RNA-seq vs qPCR Correlation
Run the correlation script:
source("scripts/correlation_coefficient.R")
The correlation plot is saved in plots/RNAseq_vs_qPCR_correlation.jpg.
📌 Example Plots

📊 GH3.17-like Bar Graph

📊 RNA-seq vs qPCR Correlation
👨‍💻 Author
Utsab Ghimire
 Research Focus: Postharvest senescence & transcriptomics
