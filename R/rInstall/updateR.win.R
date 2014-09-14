# installing/loading the package:
if(!require(installr)) {
install.packages("installr"); require(installr)} #load / install+load installr
updateR() # this will only work AFTER R 3.0.0 will be released to your CRAN mirror
update.packages(checkBuilt=TRUE)
