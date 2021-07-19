#' URL of gse series matrix
#'
#' @param ... one or more gse numbers
#'
#' @return series matrix urls
#' @export
#'
#' @examples
#' geo_gse.series.matrix.URL('gse10245')
geo_gse.series.matrix.URL <- function(...){
    gse <- toupper(c(...))
    urls <- unlist(geo_ftp.URL(gse))
    message(length(gse))
    cat(paste0(urls,'matrix/',gse,'_series_matrix.txt.gz\n'))
}
