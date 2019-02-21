#' Barley Coordinated Agricultural Project SNP Data Samples
#'
#' @description
#' Two sets of SNP marker data on populations of two-row or six-row barley breeding lines from
#' the Barley Coordinated Agricultural Project.
#'
#' @details
#'
#' The SNP maker datasets include two objects with realized SNP marker data and two objects
#' with genetic map information for those SNPs
#'
#' Two-row barley datasets:
#' \describe{
#'   \item{\code{s2_cap_lines}}{A \code{character} of 1565 line names}
#'   \item{\code{s2_cap_genos}}{A \code{matrix} of 1565 genotypes with observations on 2309 SNP markers}
#'   \item{\code{s2_snp_info}}{A \code{data.frame} describing the marker name, allele states, chromosome, and
#'   genetic position of 2309 SNP markers}
#' }
#'
#' Six-row barley datasets:
#' \describe{
#'   \item{\code{s6_cap_lines}}{A \code{character} of 761 line names}
#'   \item{\code{s6_cap_genos}}{A \code{matrix} of 761 genotypes with observations on 1758 SNP markers}
#'   \item{\code{s6_snp_info}}{A \code{data.frame} describing the marker name, allele states, chromosome, and
#'   genetic position of 1758 SNP markers}
#' }
#'
#'
#' @source
#' This data was downloaded from the Triticeae Toolbox: \url{https://triticeaetoolbox.org/barley/}
#'
#'
"s2_cap_genos"

#'
#' @rdname s2_cap_genos
#'
"s2_cap_lines"

#'
#' @rdname s2_cap_genos
#'
"s2_snp_info"

#'
#' @rdname s2_cap_genos
#'
"s6_cap_genos"

#'
#' @rdname s2_cap_genos
#'
"s6_snp_info"

#'
#' @rdname s2_cap_genos
#'
"s6_cap_lines"
