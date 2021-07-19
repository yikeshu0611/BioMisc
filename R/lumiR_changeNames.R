#' Change column names for lumiR package
#'
#' @param files txt files
#'
#' @return wrtie down
#' @export
#'
lumiR_changeNames <- function(files){
    for (i in files) {
        x <- data.table::fread(file = i)
        if (ncol(x) < 6) next(i)
        x=x[,c(1,3,4,5,6)]
        names=paste0(c("ProbeID", "AVG_SIGNAL","BEAD_STD",'Avg_NBEADS','DETECTION'),
                     "_", stringr::str_extract(i,'GSM[0-9]*'))
        if (any(colnames(x) != names)) colnames(x) = names
        message(i)
        data.table::fwrite(x,i,sep = '\t')
    }
}
