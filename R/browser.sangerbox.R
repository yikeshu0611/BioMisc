browser.sangerbox <- function(...){
    urls <- sprintf('http://sangerbox.com/Info?Id=%s',c(...))
    for (i in urls) {
        browseURL(i)
    }
}
