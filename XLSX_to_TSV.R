args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 2) {
  stop("Usage: Rscript script.R input_file.xlsx output_directory/")
}

input_data <- args[1]
output_dir <- args[2]

# install.packages('openxlsx')
library(openxlsx)

st <- getSheetNames(input_data)

for (i in st) {
  x <- read.xlsx(input_data, sheet = i, colNames = TRUE)
  output_file <- file.path(output_dir, paste0(i, ".tsv"))
  write.table(x, file = output_file, sep = "\t", quote = FALSE, na = "", row.names = FALSE)
}

