extdata <- function(package,file){
    system.file("extdata", file, package = package, mustWork = TRUE)
}

extdata('oncomineR','Oncomine1')
