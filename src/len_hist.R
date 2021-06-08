setwd("/home/sonya/Downloads/minor_project/")

# install.packages("ggplot2")
library(ggplot2)

###

NAME <- 'H3K27me3_MEL.ENCFF684CIQ.mm10'
# NAME <- 'H3K27me3_MEL.ENCFF932OHQ.mm10'

DATA_DIR <- "/home/sonya/Downloads/minor_project/"
OUT_DIR <- "/home/sonya/Downloads/minor_project/images"

###

bed_df <- read.delim(paste0(DATA_DIR, NAME, '.bed'), as.is = TRUE, header = FALSE)
#colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
colnames(bed_df) <- c('chrom', 'start', 'end')
bed_df$len <- bed_df$end - bed_df$start

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.pdf'), path = OUT_DIR)

