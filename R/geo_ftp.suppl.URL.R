#' GEO raw data from ftp
#'
#' @param ... one or more GDS, GSE, GPL, GSM number
#'
#' @return URLS
#' @export
#'
#' @examples
#' geo_ftp_url_suppl('GSE29450')
#' geo_ftp_url_suppl('GSE29450', 'GPL3480')
geo_ftp.suppl.URL <- function(...){
    urls <- geo_ftp_url(...)
    for (i in 1:length(urls)) {
        urls[[i]]=paste0(urls[[i]],'suppl/',names(urls[[i]]),'_RAW.tar')
    }
    urls
}
