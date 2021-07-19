

#' GEO Target
#' Get target information from GEO
#' @param GSE GSE number
#' @param FileName logical, whether to get Filename, default is TRUE
#' @importFrom magrittr %>%
#' @return a dataframe contains Target information
#' @export
#'
#' @examples
#' \donttest{
#' geo_Target(GSE = 'GSE21034',FileName=FALSE)
#' }
#'
geo_Target <- function(GSE,FileName=TRUE){
    if (toupper(do::left(GSE,3)) != 'GSE') GSE=paste0('GSE',GSE)
    # rvest, xml2
    url=sprintf('https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=%s',GSE)
    web=xml2::read_html(url)
    # design sample_id  sample_name
    design=web %>% rvest::html_nodes(xpath = '//tr[@valign="top"]')
    design2=design[grepl('Overall design',design)] %>%
        rvest::html_nodes(xpath = 'td')  %>%
        rvest::html_text() %>% .[2]

    sample_id=web %>% rvest::html_nodes(xpath = '//tr/td[@valign="top"]/a[@onmouseout]') %>% rvest::html_text()


    sample_name=web %>% rvest::html_nodes(xpath = '//tr/td[@valign="top"][2]') %>% rvest::html_text()
    # FileName
    if (FileName){
        url=paste0(geo_ftp_url(GSE),'suppl/filelist.txt')
        fn = paste0(gsub(':','-',Sys.time()),'.txt')
        download.file(url,fn)
        df=suppressMessages(readr::read_tsv(fn,progress = F))
        unlink(x = fn,recursive = TRUE,force = TRUE)
        cat(crayon::red('Overall design: '));cat(design2,'\n\n')
        cat(crayon::red('platform: '))
        cat(sample_id[1],'\n\n')
        cat(crayon::red('annotation: '));cat(sample_name[1],'\n\n\n')
        FileName=df$Name[do::left(df$Name,3)=='GSM']
        sample_name=sample_name[do::left(sample_id,3)=='GSM']
        sample_id=sample_id[do::left(sample_id,3)=='GSM']
        if (length(FileName) >= length(sample_id)){
            sample_id2=sample_name2=rep(NA,length(FileName))
            for (i in seq(length(sample_id))) {
                check=do::Grepl(sample_id[i],FileName)[,1]
                sample_id2[check]=sample_id[i]
                sample_name2[check]=sample_name[i]
            }
            data.frame(
                FileName=FileName,
                sample_id=sample_id2,
                sample_name=sample_name2,
                group=NA)
        }else{
            warning('FileName is less than sample_id')
            data.frame(
                FileName=NA,
                sample_id=sample_id,
                sample_name=sample_name,
                group=NA)
        }
    }else{
        cat(crayon::red('\nOverall design: '));cat(design2,'\n\n')
        cat(crayon::red('platform: '))
        cat(sample_id[1],'\n\n')
        cat(crayon::red('annotation: '));cat(sample_name[1],'\n\n\n')

        sample_name=sample_name[do::left(sample_id,3)=='GSM']
        sample_id=sample_id[do::left(sample_id,3)=='GSM']
        data.frame(
            sample_id=sample_id,
            sample_name=sample_name,
            group=NA)
    }
}

