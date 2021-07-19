

geo_gse.sample.number <- function(...){
    GSE <<- toupper(c(...))
    urls=sprintf('https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=%s',GSE)
    for (i in 1:length(GSE)) {
        if (i==1) numbers = c()
        url <- urls[i]
        message(i,'/',length(GSE),': ',GSE[i])
        web=xml2::read_html(url)

        ni <- web %>%
            rvest::html_nodes(xpath = '//tr[@valign="top"]') %>%
            grepl_and('Samples') %>%
            rvest::html_nodes(xpath = 'td')%>%
            grepl_and('Samples') %>%
            rvest::html_text() %>%
            do::Replace0(c('Samples {0,}\\(','\\).*'))
        numbers <- c(numbers, ni)
    }
    data.frame('Serie number GEO'=GSE,
               'Number of samples'=numbers)

}





