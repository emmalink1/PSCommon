#' @title common_ps
#'
#' @description A function that calls common_taxa to return a new ps object with only common taxa
#'
#' @param ps A phylyseq object
#' @param numcores An integer with number of cores to use
#' @param colname Name of column of grouping variable, as a string
#'
#' @return A lsubset phlyoseq object
#'
#' @examples
#'     common_ps(small, 2, "KitType")
#'
#' @importFrom phyloseq "otu_table"
#' @export
#'

common_ps <- function(ps, numCores, colname) {
  included = common_taxa(ps, numCores, colname)
  pruned = prune_taxa(included,ps)
  return(pruned)
}
