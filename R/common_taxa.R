#' @title common_taxa
#'
#' @description A function which returns a list of asvs/column names found in common in a group.
#'
#' @param ps A phylyseq object
#' @param numcores An integer with number of cores to use
#' @param colname Name of column of grouping variable, as a string
#'
#' @return A list of strings
#'
#' @examples
#'     common_taxa(small, 2, "KitType")
#'
#' @importFrom phyloseq "otu_table"
#' @export
#'

unique_taxa <- function(ps){
  return(colnames(otu_table(ps)))
}

common_taxa <- function(ps, numcores, colname){
  numberGroups = length(levels(as.factor(sample_data(ps)[[colname]])))
  Groups = vector(mode= "list", length = numberGroups[1])
  count = 1
  for (i in levels(as.factor(sample_data(ps)[[colname]]))){ # subset a ps object for all levels of desired factor
    ps_sub = prune_samples(sample_data(ps)[[colname]] ==i, ps)
    ps_sub = prune_taxa(taxa_sums(ps_sub)>1, ps_sub)
    Groups[count] = ps_sub
    count = count+1
  }
  UniqueLists = mclapply(Groups, unique_taxa, mc.cores = numCores)
  included = UniqueLists[[1]]
  for (i in length(UniqueLists)){
    included = intersect(included, UniqueLists[[i]])
  }
  return(included)
}
