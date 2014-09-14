# Install Packages will used form Cran
setwd("~/Dropbox/config/Rconfig/Rpkgs/Rpkgs.lst")
pkgs.d  <- read.csv("rInstall.lst.txt")
pkgs.m  <- as.matrix(pkgs.d)
pkgs.v  <- pkgs.m[,1]
install.packages(pkgs.v)
