#' Clear "Oncomine" database
#' This function should be used with "Save Page WE" plugin in chrome.
#' @param ... html data
#'
#' @return a dataframe
#' @export
#'
#' @examples
#' library(BioMisc)
#' x1 <- system.file('extdata','Oncomine1.html',package = 'BioMisc')
#' x2 <- system.file('extdata','Oncomine2.html',package = 'BioMisc')
#' oncomine(x1,x2)
oncomine <- function(...){
    res <- c(...) |>
        lapply(oncomine_i)
    if (length(res)==1){
        res[[1]]
    }else{
        for (i in 1:length(res)) {
            if (i==1){
                ri <- res[[1]]
            }else{
                ri <- suppressMessages(dplyr::full_join(ri,res[[i]]))
            }
        }
        ri
    }
}
oncomine_i <- function(i){
    html <- xml2::read_html(i)
    select <- html |>
        rvest::html_elements(xpath = '//select[@id="fGroupBy"]//option') |>
        set::grep_and('selected') |>
        rvest::html_text()
    left <- html |>
        rvest::html_elements(xpath = '//map//area') |>
        rvest::html_attr('om4:leftcontent')
    right <- html |>
        rvest::html_elements(xpath = '//map//area') |>
        rvest::html_attr('om4:rightcontent')
    dfi <- lapply(1:length(left), function(i){
        head <- strsplit(left[i],'\\|\\|')[[1]] |>
            do::Replace0(':')

    dfi <- strsplit(right[i],'\\|\\|')[[1]] |>
        matrix(nrow = 1,dimnames = list(NULL,head)) |>
        data.frame()
    colnames(dfi)[grepl('legend',tolower(colnames(dfi)))] <- make.names(select)
    dfi
    })
    do.call(plyr::rbind.fill,dfi)
}

