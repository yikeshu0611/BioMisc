
# geo_GSE8GPL('GSE18842','GSE19804')
geo_GSE8GPL <- function(...){
    x<-c(...)
    x=toupper(x)
    if (any(do::left(x,3) != 'GSE')) stop('must be GSE')
    url=geo_webpage_url(x)
    library(magrittr)
    for (i in seq(length(url))) {
        if (i==1) res=list()
        web=xml2::read_html(url[i])
        sample_id=web %>% rvest::html_nodes(xpath = '//tr/td[@valign="top"]/a[@onmouseout]') %>% rvest::html_text()
        sample_name=web %>% rvest::html_nodes(xpath = '//tr/td[@valign="top"][2]') %>% rvest::html_text()
        res=c(res,list(c(sample_id[1],sample_name[1])))
        names(res)[i]=x[i]
    }
    res
}
# geo_GSE2GSM('GSE18842','GSE19804')
geo_GSE2GSM <- function(...){
    x<-c(...)
    x=toupper(x)
    if (any(do::left(x,3) != 'GSE')) stop('must be GSE')
    url=geo_webpage_url(x)
    library(magrittr)
    for (i in seq(length(url))) {
        if (i==1) res=list()
        web=xml2::read_html(url[i])
        sample_id=web %>% rvest::html_nodes(xpath = '//tr/td[@valign="top"]/a[@onmouseout]') %>% rvest::html_text()
        res=c(res,list(sample_id[do::left(sample_id,3)=='GSM']))
        names(res)[i]=x[i]
    }
    res
}

# geo_GSM8GSEGPL('GSM494675','GSM467036')
geo_GSM8GSEGPL <- function(...,GSEinfo=TRUE){
    x<<-c(...)
    x=toupper(x)
    if (any(do::left(x,3) != 'GSM')) stop('must be GSM')
    url=geo_webpage_url(x)
    library(magrittr)
    for (i in seq(length(url))) {
        if (i==1) res=list()
        web=xml2::read_html(url[i])
        gpl=web %>% 
            rvest::html_nodes(xpath = '//tr[@valign="top"]') %>% 
            .[grepl('Platform ID',.)] %>%
            rvest::html_nodes(xpath = 'td[2]') %>%
            rvest::html_text()
        gse=web %>% rvest::html_nodes(xpath = '//tr/td[@valign="top"]/a[@onmouseout]') %>% rvest::html_text()
        gseinfo=web %>% rvest::html_nodes(xpath = '//tr/td[@valign="top"][2]') %>% rvest::html_text()
        if(GSEinfo) gse=paste0(gse,'::: ',gseinfo)
        res=c(res,list(c(gpl,gse)))
        names(res)[i]=x[i]
    }
    res
}

# geo_GSM8GSE('GSM494675','GSM467036',GSEinfo=FALSE)
geo_GSM8GSE <- function(...,GSEinfo=TRUE){
    x<<-c(...)
    x=toupper(x)
    if (any(do::left(x,3) != 'GSM')) stop('must be GSM')
    url=geo_webpage_url(x)
    library(magrittr)
    for (i in seq(length(url))) {
        if (i==1) res=list()
        web=xml2::read_html(url[i])
        gse=web %>% rvest::html_nodes(xpath = '//tr/td[@valign="top"]/a[@onmouseout]') %>% rvest::html_text()
        gseinfo=web %>% rvest::html_nodes(xpath = '//tr/td[@valign="top"][2]') %>% rvest::html_text()
        if(GSEinfo) gse=paste0(gse,'::: ',gseinfo)
        res=c(res,list(gse))
        names(res)[i]=x[i]
    }
    res
}
# geo_GSM8GPL('GSM494675','GSM467036')
geo_GSM8GPL <- function(...){
    x<<-c(...)
    x=toupper(x)
    if (any(do::left(x,3) != 'GSM')) stop('must be GSM')
    url=geo_webpage_url(x)
    library(magrittr)
    for (i in seq(length(url))) {
        if (i==1) res=list()
        web=xml2::read_html(url[i])
        sample_id=web %>% rvest::html_nodes(xpath = '//tr/td[@valign="top"]/a[@onmouseout]') %>% rvest::html_text()
        sample_name=web %>% rvest::html_nodes(xpath = '//tr/td[@valign="top"][2]') %>% rvest::html_text()
        
        gpl=web %>% 
            rvest::html_nodes(xpath = '//tr[@valign="top"]') %>% 
            .[grepl('Platform ID',.)] %>%
            rvest::html_nodes(xpath = 'td[2]') %>%
            rvest::html_text()
        res=c(res,list(gpl))
        names(res)[i]=x[i]
    }
    res
}


