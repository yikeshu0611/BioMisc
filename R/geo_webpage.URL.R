#' geo webpage url
#'
#' @param ... one or more GDS, GSE, GPL, GSM number
#'
#' @return URLS
#' @export
#'
#' @examples
#' geo_webpage_url('GSE29450')
#' geo_webpage_url('GSE29450', 'GPL3480')
geo_webpage.URL <- function(...){
    x<-c(...)
    x=toupper(x)
    sprintf('https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=%s',x)

}
