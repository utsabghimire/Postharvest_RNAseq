# **RNA-seq Differential Expression Analysis Using DESeq2** 🎯🧬

---

## 📌 **Overview**

This repository contains an **RNA-seq analysis pipeline** using **DESeq2** for differential expression analysis between control and treatment conditions. The script processes raw count data, performs normalization, statistical testing, and outputs differentially expressed genes.

---

## 📂 **Files in This Repository**

- `DESeq2_analysis.R` – Main script for RNA-seq differential expression analysis  
- `dummy_rna_seq.txt` – Sample input count matrix (gene expression data)  
- `deseq2_results.txt` – Output file with differentially expressed genes (tab-separated)  
- `deseq2_results.xlsx` – Output file in Excel format for easy visualization  

---

## 🛠 **Requirements**

Install the required packages in R before running the script:

```r
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
BiocManager::install("DESeq2")
install.packages("openxlsx")  # For exporting results to Excel
```

---

## 🔬 **Data Format**

The input count matrix should be a tab-separated file with the following format:

```
Gene_name	Control_1	Control_2	Control_3	Treatment_1	Treatment_2	Treatment_3
GeneA	    100	        120	        130	        200	        250	        270
GeneB	    50	        55	        60	        80	        90	        85
```

- The **first column** contains gene names  
- The next columns contain **raw read counts** for each replicate

---

## 🚀 **How to Run the Analysis**

1. Clone the repository:

```bash
git clone https://github.com/your-username/RNAseq_DESeq2_Analysis.git
cd RNAseq_DESeq2_Analysis
```

2. Open `DESeq2_analysis.R` in RStudio and update the input file path if needed:

```r
file_path <- "dummy_rna_seq.txt"
```

3. Run the script in R:

```r
source("DESeq2_analysis.R")
```

4. Output files will be generated:

- `deseq2_results.txt` → Tab-separated results  
- `deseq2_results.xlsx` → Excel file for easy review  

---

## 📊 **Understanding the Output**

The results file contains key statistics:

| Gene   | log2FoldChange | p-value | padj  |
|--------|----------------|---------|-------|
| GeneA  | 1.52           | 0.002   | 0.005 |
| GeneB  | -0.87          | 0.010   | 0.020 |

- **log2FoldChange**: Positive = Upregulated, Negative = Downregulated  
- **p-value**: Significance of differential expression  
- **padj**: Adjusted p-value using FDR  

---

## 📊 **Optional: Generate Bar Graphs**

Generate bar graphs from RNA-seq data:

```r
source("scripts/bar_graphs.R")
```

📁 Plots will be saved in the `plots/` folder.

---

## 🔁 **Optional: RNA-seq vs qPCR Correlation**

Run the correlation script:

```r
source("scripts/correlation_coefficient.R")
```

🖼️ The correlation plot is saved as:

```
plots/RNAseq_vs_qPCR_correlation.jpg
```

---

## 🧪 **Example Plots**

📊 **GH3.17-like Bar Graph**  
📊 **RNA-seq vs qPCR Correlation**

---

## 👨‍💻 **Author**

**Utsab Ghimire**  
*Research Focus: Postharvest Senescence & Transcriptomics*

---
