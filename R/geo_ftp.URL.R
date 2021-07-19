#' GEO ftp data url for download
#'
#' @param ... one or more GDS, GSE, GPL, GSM number
#'
#' @return URLS
#' @export
#'
#' @examples
#' geo_ftp_url('GSE29450')
#' geo_ftp_url('GSE29450', 'GPL3480')
geo_ftp.URL <- function(...){
    object <- c(...)
    object=toupper(object)
    for (i in seq(length(object))) {
        if (i==1) urls=list()
        url.i=object[i]
        if (do::left(url.i,3)=='GDS') urls[[i]]=paste0('https://ftp.ncbi.nlm.nih.gov/geo/datasets/GDS',
                                                       do::knife_right(do::Replace0(url.i,'GDS'),3),'nnn/',url.i,'/')
        if (do::left(url.i,3)=='GSE') urls[[i]]=paste0('https://ftp.ncbi.nlm.nih.gov/geo/series/GSE',
                                                       do::knife_right(do::Replace0(url.i,'GSE'),3),'nnn/',url.i,'/')
        if (do::left(url.i,3)=='GPL') urls[[i]]=paste0('https://ftp.ncbi.nlm.nih.gov/geo/platforms/GPL',
                                                       do::knife_right(do::Replace0(url.i,'GPL'),3),'nnn/',url.i,'/')
        if (do::left(url.i,3)=='GSM') urls[[i]]=paste0('https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM',
                                                       do::knife_right(do::Replace0(url.i,'GSM'),3),'nnn/',url.i,'/')
        names(urls[[i]])=object[i]
    }
    urls
}


