#' Download geo series matrix
#'
#' @param ... one or more gse
#' @param chrome logical, whether to download by chrome
#' @param sleep wait second, default is 5
#' @return series matrix url
#' @export
#'
download_geo_series_matrix <- function(...,chrome=FALSE,sleep=5){
    gse <- c(...)
    urls <- geo_ftp.URL(gse) |>
        unlist() |>
        sprintf(fmt = '%smatrix')

    for (i in do::seq_range(urls)) {
        if (i==1) mtrurl <- c()
        html <- tryCatch(xml2::read_html(urli),error=function(e) 'e')
        if (all(html=='e')) next(i)
        mtr <- html |>
            rvest::html_elements(xpath = '//pre//a') |>
            set::grep_not_or('Parent') |>
            rvest::html_text()
        mtri <- paste0(urli,'/',mtr)
        if (chrome){
            for (i in mtri) {
                browseURL(i)
                Sys.sleep(sleep)
            }
        }
        mtrurl <- c(mtrurl,mtri)
    }
    mtrurl
}

