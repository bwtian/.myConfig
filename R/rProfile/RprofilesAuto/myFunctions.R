
R_ver  <- as.character(getRversion())
.upR <- function() {
        if(!require(installr)) {
                install.packages("installr")
        } #load / install+load installr
        updateR() # this will only work AFTER R 3.0.0 
        update.packages(checkBuilt=TRUE, ask = FALSE)
}
.upPkgs <- function() {
        update.packages(checkBuilt=TRUE, ask = FALSE, dependencies = c('Suggests'))
}
.proxy  <- function(){
        Sys.setenv("http_proxy"="http://proxy.kuins.net:8080/")
}
rnw2r  <- function(Rnw){
        purl(Rnw)
}
