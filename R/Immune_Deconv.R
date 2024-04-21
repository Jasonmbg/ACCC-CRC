############################################################################################
################## Immune Deconvolution approaches #########################################
################## ACCC-CRC dataset ########################################################

# use this installation for the immunedeconv R package for more recent updates:
# library(remotes)
# remotes::install_github("icbi-lab/immunedeconv")
library(immunedeconv)
library(tidyverse)
library(here)

dr_here()

# load the respective gene expression matrix; which is unlogged TPM values
tpm.noLog.dat <- read_tsv(here("Data","ACCC.CRC.TPM.NoLog.ExpDat.Annot.RNASeq.txt"))  

# fix also missing header of the gene symbols
dat.2 <- tpm.noLog.dat %>% column_to_rownames("...1")

norm.matrix <- as.matrix(dat.2)

res_estimate <- immunedeconv::deconvolute_estimate(norm.matrix)
res_estimate_dat <- res_estimate %>% rownames_to_column(var="ESTIMATE_Scores")
# write_tsv(res_estimate_dat, file="Immunedeconv.RES.ESTIMATE.ACCC.CRC.MSI.REClassified.UnLogTPM.tsv")

# For the CIBERSORTx estimates, please use the updated web server portal to fetch and compute
# cell specific & absolute scores here: https://cibersortx.stanford.edu/

##########################################################################################
##########################################################################################
##########################################################################################