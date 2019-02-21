## Simulation data preparation
library(tidyverse)

# Load simulation data
load(file.path("C:/Users/jln54/GoogleDrive/BarleyLab/Projects/SideProjects/Resources/s2_cap_simulation_data.RData"))

# Filter for breeding programs relevant to my data
s2_cap_genos <- s2_cap_genos[str_detect(string = row.names(s2_cap_genos), pattern = "AB|BA|WA|N2|MT"),]
s2_cap_genos <- s2_cap_genos[,!colMeans(s2_cap_genos) %in% c(0, 2)]
s2_snp_info <- subset(s2_snp_info, rs %in% colnames(s2_cap_genos))

devtools::use_data(s2_cap_genos, s2_snp_info)


load(file.path("C:/Users/jln54/GoogleDrive/BarleyLab/Projects/SideProjects/Resources/s6_cap_simulation_data.RData"))


# Filter for breeding programs relevant to my data
s6_cap_genos <- s6_cap_genos[,!colMeans(s6_cap_genos) %in% c(0, 2)]
s6_snp_info <- subset(s6_snp_info, rs %in% colnames(s6_cap_genos))

devtools::use_data(s6_cap_genos, s6_snp_info)

