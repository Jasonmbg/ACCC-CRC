############## INFERENCE OF CMS SUBTYPES FOR THE ACCC-CRC COHORT ##########################
###########################################################################################

# https://github.com/Lothelab/CMScaller
# https://github.com/Lothelab/CMScaller/blob/master/inst/doc/CMScaller.pdf

library(CMScaller)
library(tidyverse)
library(here)

dr_here()

norm.filt.exp.dat <- read_tsv(here("Data",
"ACCC.CRC.Norm.VoomQualWeights.CPM.REclassified.MSI.tsv"))

norm.filt.exp.mat <- norm.filt.exp.dat %>% 
column_to_rownames(var="rowname") %>% as.matrix()

# match as rownames argument the respective gene symbols;

res <- CMScaller(norm.filt.exp.mat, rowNames="symbol",RNAseq=FALSE, seed=123, doPlot=TRUE)
res_2 <- res %>% rownames_to_column(var="ACCC_Sample_ID")

# write_tsv(res_2, file="Out_RES_DT_CMScaller_ACCC_28samples.tsv")                                      

##########################################################################################
##########################################################################################
##########################################################################################