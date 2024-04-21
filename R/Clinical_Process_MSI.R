################################ R script ###################################################
######### How to create the final clinical information containing also the MSI status #######
######### Proceed as below to format input files for downstream RNAseq analysis #############

# This file is purely for demonstration-reproducibility purposes and to echo how the necessary
# phenotypic information, along with MSI status were estimated and merged;
# For the main analyses of the manuscript, please refer to the available .qmd files;

library(PreMSIm) # PreMSIm_1.0
library(tidyverse)
library(here)

dr_here()

# use directly the produced-as suggested by the vignette-log2(TPM +1) transformed values

pt <- here("Data/ACCC.CRC.TPM.Log2Transform.ExpDat.Annot.RNASeq.txt")

input_crc = data_pre(pt, type = "Symbol")

out.msi <- msi_pre(input_crc) # Prediction results  ("1" indicates MSI-high, and "0" MSI-low/microsatellite stability).

# write_tsv(out.msi,file="MSIStatus.PreMSIm.Predict.Log2TPM.ACCC.CRC.tsv")

# also load the *initial* available clinical information;

pdat <- read_tsv(here("Data","ACCC.CRC.PhenoInfo.RNASeq.ReClassified.txt"))

identical(pdat$Sample_Name, out.msi$Sample)

merged.msi.mut.dat <- inner_join(pdat,out.msi,by=c("Sample_Name"="Sample"))

# Now load the curated available clinical data for these common patients:

total.clin.dat <- read_tsv(here("Data","ACCC.CRC.Updated.ClinicalData.txt"))

tl <- total.clin.dat$tumor_location

tl.updated <- recode(tl, ascending_colon="right_sided",
                     caecum="right_sided",descending_colon="left_sided",rectum="left_sided",
                     rectum_descending_colon="left_sided",right_colon_flexture="right_sided",
                     sigmoid_colon="left_sided", .default = NA_character_)

total.clin.dat$tumor_location <- tl.updated

merged.final.accc.clin.pheno.dat <- inner_join(merged.msi.mut.dat,total.clin.dat,
                                               by="Patient_Barcode")

# save the final merged clinico-pathological information into a collapsed tsv file

# write_tsv(merged.final.accc.clin.pheno.dat, "CRC.ACCC.Clinical.Total.Merged.MSI.Mut.Info.RNASeq.tsv")

############################################################################################
############################################################################################
############################################################################################