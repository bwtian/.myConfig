#!/bin/sh
# ==============================================================================
# 0.1 Download
# ==============================================================================
# http://cran.r-project.org/
# ftp://ftp.stat.math.ethz.ch/Software/R/
# http://cran.r-project.org/src/
# SVN
# ==============================================================================
# 0.2 Install the depence 
# ==============================================================================
sudo apt-get build-dep r-base-core
# sudo apt-get build-dep r-base-dev
# ==============================================================================
# 1. Install the newest R package in .../R/release/new
# ==============================================================================
cd ~/Dropbox/soft/linux/R/
subdir=./release/new/
fName=$(\ls ${subdir}) 
verR=$(basename ${fName} .tar.gz)
tar zxvf ./release/new/${fName} -C .
cd ${verR}
# ./configure --prefix=/where/you/want/R/to/go (typically /usr/local or /opt/local) and can be set by
# ./configure --prefix=/home/tian/Dropbox/soft/linux/R/$verR  <options>
# --with-x=no and --enable-R-shlib if you just use rstudio  # no x need and shared/dynamic library libR.so
# This will install to the following directories:
# prefix/bin or bindir            # the front-end shell script and other scripts and executables
# prefix/man/man1 or mandir/man1  # the man page
# prefix/LIBnn/R or libdir/R      # all the rest (libraries, on-line help system, . . . ). 
# Here LIBnn is usually ‘lib’, but may be ‘lib64’ on some 64-bit Linux systems. 
# ./configure --prefix=/usr/local --with-x=no --enable-R-shlib --enable-prebuilt-html
./configure --enable-R-shlib --prefix=/usr/local 
make
make check
# make info
make pdf
# make tests
make install
make install-pdf
### ebooks, requires ebook-convert from Calibre (http: / / calibre-ebook . com / download)
#make ebooks
# make epub
# make mobi
# make install rhome=/usr/local/lib64/R-3.0.3
# make prefix=/path/to/here install-libR   ##made R as a shared/dynamic library
# make install-info
# make install-pdf    ## PDF versions of the manuals
# make install-tests  ## run-time tests that are part of make check-all 
# ==============================================================================
# 2 Symbolic Link or Set $PATH, link is more simple and convenient
# path is better due to no new files created: PATH for R Rstudio ESS ESS help
# ==============================================================================

# sudo ln -sfv ~/Dropbox/soft/linux/R/${verR}/bin/R /usr/local/lib/R/library
sudo ln -sfv ~/Dropbox/soft/linux/R/${verR}/bin/R /usr/local/bin/R
#sudo mkdir -p -- /usr/local/lib/R
#sudo ln -sfv ~/Dropbox/soft/linux/R/${verR}/ /usr/local/bin/R
#mkdir -p -- /usr/local/lib/R/doc/manual
#sudo rm -vf  /usr/share/man/man1/R.1.gz
# export PATH=${PATH}:/home/tian/Dropbox/soft/linux/R/R-3.0.3/bin
# export RSTUDIO_WHICH_R=/home/tian/Dropbox/soft/linux/R/R-3.0.3/bin/R
# ==============================================================================
# 3 Check the install
# ==============================================================================
echo "which R is:" $(which R)
echo "whereis R is:" $(whereis R)
