# ACCC-CRC
*Main part* of the broader Athens Comprehensive Cancer Center Project (https://accc.gr/index.html) regarding precision oncology and Colorectal Cancer with title "*Molecular and functional profiling unravels targetable vulnerabilities in colorectal cancer*".

#### Efstathios-Iason Vlachavas
###### DKFZ-Division of Molecular Genome Analysis (B050)
##### Efstathios-Iason.Vlachavas@dkfz-heidelberg.de
##### svlachavas@eie.gr

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.10959700.svg)](https://doi.org/10.5281/zenodo.10959700)

# OVERVIEW OF THE PROJECT

*Colorectal Cancer (CRC) is a highly heterogeneous group of diseases, with distinctive genetic and epigenetic alterations. CRC tumors bearing KRAS or BRAF mutations still remain resistant to new therapies. Thus, this augments the necessity to reveal new therapeutic targets in mut KRAS/BRAF, which may account for up to 50% of the total CRC patients. To this end, we investigated primary untreated CRC tumors (WES & RNA-Seq) from 28 Greek patients for their systematic molecular characterization and stratification into diverse groups based on their microsatellite instability (MSI) status and KRAS/BRAF genetic variations, in order to unravel novel targets and putative personalized treatment interventions*.

## Small overview of the complete project framework

![1) First step is to fetch-process separately and in the same context the 2 public CRC datasets along with the ACCC-CRC cohort.
2) Group primarily the patients based on MSI status and subsequently on critical somatic mutations.
3) Ultimate goal: through multi-layered integrative analysis to explore the molecular profile of MSI/MSS CRCs and its relation to KRAS/BRAF mutations in the context of personalized medicine.
](./Graphical_Abstract_ACCC_CRC_project.png)

## Summarized framework illustrating variant prioritization scheme. 

![Briefly, using 15 distinct prior-knowledge variant and gene annotation resources, an integrated scoring value (0-1) is assigned to each variant as a holistic score, ranking variants from a single patient’s variant list.
](./SVRACAS_Overview_ACCC_CRC_Project.png)

## Description

## Notes on data acquisition and cohort definition

Metadata utilization
-Complete raw data along with the relevant clinical information (i.e. alternative sample names) have been deposited to the EGA archive [EGAD00001011262 and EGAD00001011263] under controlled access.

RNASeq data
- The analysis starts essentially with the DGE list object including raw counts, gene annotation and sample phenotype information.
- Further methodological details on the complete analysis are included in the accompanied .qmd files & Materials & Methods section of the manuscript.

WES data
- Likewise, the main code hosted here is focused to reproduce main findings and mutational analyses related to the somatic alterations, using already processed files and pre-analyzed data . Further information, additional files and supplementary analyses are also included in the Zenodo repository and Materials & Methods/Supplementary Data sections.

##### **Note**: Any 'save' function in R (as well as other commonly used functions in R to export objects in various formats, such as *write_tsv*) documented along with a hashtag # sign are typically used to demonstrate how an object was created and is not intended to be run as part of regular code execution.

## Important R packages that need to be installed for reproducing the analysis:

```r

packages = c(
    "edgeR",
    "progeny",
    "dorothea",
    "decoupleR",
    "circlize",
    "ComplexHeatmap",
    "InteractiveComplexHeatmap",
    "tidyverse",
    "decoupleR",
    "OmnipathR",
    "limma",
    "xml2",
    "downlit",
    "here",
    "DT",
    "data.table",
    "hrbrthemes",
    "org.Hs.eg.db",
    "ggplot2",
    "forcats",
    "DOSE",
    "clusterProfiler",
    "EnsDb.Hsapiens.v75",
    "biomaRt",
    "CMScaller",
    "remotes"
)

if(!requireNamespace("BiocManager")) {
    install.packages("BiocManager")
}

library(BiocManager)

for(p in packages) {
    if(!requireNamespace(p)) {
        install(p)
    }
}

```
## Implementation

- The user just needs to download/clone the respective github repository;
- For example `git clone https://github.com/Jasonmbg/ACCC-CRC.git


## Acknowledgements

Konstantinos Voutetakis

Olga Papadodima

Gregor Warsow

Aurelien Dugourd

Marcos Díaz-Gay

Lukas Beumers

Constantinos Yeles

Ryangguk Kim

Kymberleigh Pagel

Stefan Wiemann

##### In addition, we would like to thank Julio Saez-Rodriguez's group (https://github.com/saezlab) for their continuous feedback, ideas and comments concerning the robust implementation of their respective computational tools and prior knowledge biological databases;
