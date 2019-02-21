#purpose of script is to prepare oat geno and pheno files for simulation scripts


#setwd("/Users/ianmcnish/Google Drive File Stream/My Drive/projects/2018_gs_simulation")

#load oat geno file
geno <- read.csv("data/founder_genotypes_26jun2018_marker_defs.csv", header = TRUE)
#eliminate markers with negative or n/a mapping positions
geno <- geno[geno$pos >= 0,]
geno <- geno[-which(is.na(geno$pos)),]
#jitter identical mapping positions, this is required to simulate recombination
geno$pos <- jitter(geno$pos, factor = 1, amount = 10^-6)
geno$chr <-as.numeric(sub("Mrg", "", geno$chr))

#load phenotypes and limit to founder trials
pheno <- read.csv("data/field_6dec18.csv", header = TRUE, na.strings = c("na", ""))
#limit phenotypic data to founder trials
pheno <- pheno[pheno$trial_name %in% c("founder_2016_crk",
                                       "founder_2016_lam",
                                       "founder_2016_mos",
                                       "founder_2016_stp",
                                       "founder_2016_rse",
                                       "founder_2016_vog",
                                       "founder_2017_crk",
                                       "founder_2017_mos",
                                       "founder_2017_lam",
                                       "founder_2018_crk",
                                       "founder_2018_lam_late"),]

pheno <- pheno[,c("line",
                  "trial_name",
                  "yield")]

pheno <- pheno[complete.cases(pheno),]

write.csv(x = geno, file = "results/oat_geno.csv", row.names = FALSE)
write.csv(x = pheno, file = "results/oat_pheno.csv", row.names = FALSE)
