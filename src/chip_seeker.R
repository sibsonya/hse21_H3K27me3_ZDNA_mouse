setwd("/home/sonya/minor_project/")

# if (!requireNamespace("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# BiocManager::install("TxDb.Mmusculus.UCSC.mm10.knownGene")
# BiocManager::install("ChIPseeker")
# BiocManager::install("org.Mm.eg.db")
# BiocManager::install("clusterProfiler")

library(ggplot2)
library(dplyr)
library(ChIPseeker)
library(TxDb.Mmusculus.UCSC.mm10.knownGene)
library(org.Mm.eg.db)
library(clusterProfiler)

###

DATA_DIR <- "/home/sonya/minor_project/"
OUT_DIR <- "/home/sonya/minor_project/images"

###

NAMES <-c('H3K27me3_MEL.ENCFF684CIQ.mm10.filtered',
          'H3K27me3_MEL.ENCFF932OHQ.mm10.filtered',
          'mouseZ-DNA1',
          'H3K27me3_MEL.intersect_with_mouseZ-DNA1')

for (NAME in NAMES){  
  txdb <- TxDb.Mmusculus.UCSC.mm10.knownGene
  bed_fn <- paste0(DATA_DIR, NAME, '.bed')
  peakAnno <- annotatePeak(bed_fn, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Mm.eg.db")
  
  png(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.png'))
  plotAnnoPie(peakAnno)
  dev.off()
}
