#' @title unique_taxa
#'
#' @description A function which returns the column names of a ps object as a list
#'
#' @param ps A phylyseq object
#' @return A list of strings
#'
#' @examples
#'
#' @importFrom phyloseq "otu_table"
#' @export

unique_taxa <- function(ps){
  return(colnames(otu_table(ps)))
}


