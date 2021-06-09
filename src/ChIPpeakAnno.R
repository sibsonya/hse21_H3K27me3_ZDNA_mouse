setwd("/home/sonya/minor_project/")

# BiocManager::install("ChIPpeakAnno")
# BiocManager::install("org.Mm.eg.db")

library(ggplot2)
library(dplyr)
library(ChIPpeakAnno)
library(TxDb.Mmusculus.UCSC.mm10.knownGene)
library(org.Mm.eg.db)

###

DATA_DIR <- "/home/sonya/minor_project/"

###


peaks <- toGRanges(paste0(DATA_DIR, 'H3K27me3_MEL.intersect_with_mouseZ-DNA1.bed'), format="BED")
peaks[1:2]

annoData <- toGRanges(TxDb.Mmusculus.UCSC.mm10.knownGene)
annoData[1:2]


anno <- annotatePeakInBatch(peaks, AnnotationData=annoData, 
                            output="overlapping", 
                            FeatureLocForDistance="TSS",
                            bindingRegion=c(-2000, 300))
data.frame(anno) %>% head()

anno$symbol <- xget(anno$feature, org.Mm.egSYMBOL)
data.frame(anno) %>% head()

anno_df <- data.frame(anno)
write.table(anno_df, file=paste0(DATA_DIR, 'H3K27me3_MEL.intersect_with_mouseZ-DNA1.genes.txt'),
            col.names = TRUE, row.names = FALSE, sep = '\t', quote = FALSE)

uniq_genes_df <- unique(anno_df['symbol'])
write.table(uniq_genes_df, file=paste0(DATA_DIR, 'H3K27me3_MEL.intersect_with_mouseZ-DNA1.genes_uniq.txt'),
            col.names = FALSE, row.names = FALSE, sep = '\t', quote = FALSE)
