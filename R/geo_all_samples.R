geo_all_samples <- function(){
    library(rvest)
    url <- 'https://www.ncbi.nlm.nih.gov/geo/browse/?view=samples&zsort=date&display=10&page=1'
    html <- xml2::read_html(url)
    all <- html %>%
        rvest::html_elements(xpath = '//div[@id="count"]') %>%
        rvest::html_text() %>%
        do::Replace0(' samples') %>%
        as.numeric()
    message('all samples: ',all)
    pb <- txtProgressBar(max = ceiling(all/5000),width = 30,style = 3)
    for (i in 1:ceiling(all/5000)) {
        setTxtProgressBar(pb,i)
        if (i == 1) x=data.frame()
        xi=data.table::fread(encoding = 'UTF-8',
                             sprintf('https://www.ncbi.nlm.nih.gov/geo/browse/?view=samples&zsort=date&mode=tsv&page=%s&display=5000',i))
        x=rbind(x,xi)
    }
    x
}
