## Update the package list
sudo aptitude update & aptitude safe-ugrade
## Install the depencies
sudo aptitude build-dep -y r-base-core
# Install r-base-core
sudo aptitude install -y r-base-core
# [sudo] password for tian: 
# The following NEW packages will be installed:
#   cdbs{a} dh-translations{a} intltool{a} libxml-parser-perl{a} 
#   python-scour{a} r-base-core r-base-dev{a} r-cran-boot{a} r-cran-class{a} 
#   r-cran-cluster{a} r-cran-codetools{a} r-cran-foreign{a} 
#   r-cran-kernsmooth{a} r-cran-lattice{a} r-cran-mass{a} r-cran-matrix{a} 
#   r-cran-mgcv{a} r-cran-nlme{a} r-cran-nnet{a} r-cran-rpart{a} 
#   r-cran-spatial{a} r-cran-survival{a} r-doc-html{a} r-recommended{a} 

#aptitude install -y r-recommended
#aptitude install -y r-base-dev
#aptitude install -y r-cran-*
#aptitude install -y r-doc-html
#aptitude install -y r-doc-info
#aptitude install -y r-doc-pdf
sudo aptitude install -y r-mathlib
sudo aptitude install -y ess
# ##############################################################################
# 5. Delete the r lib in sourcelist
# ##############################################################################
sudo aptitude update & aptitude safe-ugrade
echo "which R is:" $(which R)
echo "whereis R is:" $(whereis R)
