## Prepare genotype and phenotype data on the S2TP for simulation use
##
##

## Genotype data
##
## This was downloaded from T3 using all possible markers
##

# Read in the hapmap file
# This was all available marker data for the S2TP
geno <- read_tsv("sandbox/S2TP_T3_download/genotype.hmp.txt")
# Read in 9K data
geno9k <- read_csv(file = "Z:/BARLEY_LAB/Genomic Selection/Winter 2019 GS--Genotype data/par_9k_hmp.csv") %>%
  rename_at(vars(which(str_count(names(.), "-") > 1)), ~str_remove(., "-"))

# Remove markers with unknown or no position
geno1 <- geno %>%
  mutate_at(vars(-rs:-pos), parse_number) %>%
  filter(chrom != "UNK", !is.na(pos))


# Read in line information
line_info <- readxl::read_excel(path = "sandbox/S2TP_T3_download/Line_Details.xls")
# Get the right synonym
line_info1 <- line_info %>%
  mutate(synonym1 = str_split(Synonym, ", ") %>% map(~str_subset(., "^[0-9]{2}[A-Z0-9]{2}")) %>% map(tail, 1),
         synonym1 = ifelse(Name == "2ND24393", "06N2-56", synonym1)) %>%
  unnest(synonym1)

# Rename the lines in the geno matrix
row.names(geno_mat) <- line_info1$synonym1[match(x = row.names(geno_mat), table = line_info1$Name)]

## Subset the 9k geno data
geno9k1 <- geno9k %>%
  select(rs = marker, chrom, pos, which(names(.) %in% line_info1$synonym1)) %>%
  mutate(rs = ifelse(str_detect(rs, "BOPA"), str_remove(rs, "BOPA[1-2]_"), rs))



### Download the physical map for





## Find overlapping markers
overlapping_markers <- full_join(select(geno1, rs, chrom, pos), select(geno9k1, rs, chrom, pos), by = c("chrom", "pos"))





# Extract marker matrix
geno_mat <- t(select(geno1, -rs:-pos))
colnames(geno_mat) <- geno1$rs
# Glance
geno_mat[1:5, 1:5]



geno9k_mat <- t(select(geno9k1, -rs:-pos))
colnames(geno9k_mat) <- geno9k1$rs




