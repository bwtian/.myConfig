#!/bin/sh
#+TITLE:     updateR.deb.R
#+AUTHOR:    Bingwei TIAN
#+EMAIL:     bwtian@gmail.com
#+DATE:      <2013-04-04 Sun> <2013-09-20 Fri>
#+DESCRIPTION: Install latest R on Debian, Ubuntu, Mint and other deb Linux
#+KEYWORDS: Run is a ROOT!!!
#+LANGUAGE:  en
#+LATEST EDIT:
# ##############################################################################
# 0. Backup and get the version of Ubuntu
# ##############################################################################
cp /etc/apt/sources.list /etc/apt/sources.list.$(date +%F)
# Get the version of Ubuntu
codename=$(lsb_release -sc)
# ##############################################################################
# 1.Add favorite mirror to sources.list
# Write favorite source CRAN to apt/sources.list, 1 time for 1 machine
# http://cran.r-project.org/mirrors.html
# ##############################################################################
echo  >> /etc/apt/sources.list
echo "## R  mirror for Update" >> /etc/apt/sources.list
echo "deb http://cran.md.tsukuba.ac.jp/bin/linux/ubuntu/ $codename/" >> /etc/apt/sources.list
echo "deb http://cran.ism.ac.jp/bin/linux/ubuntu/ $codename/" >> /etc/apt/sources.list
### Check 
nano /etc/apt/sources.list
# ##############################################################################
# 2.ubuntu apt key for R
# ##############################################################################
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9  # Fetch the secure APT key
gpg -a --export E084DAB9 | sudo apt-key add -   # Feed it to apt-key

# ##############################################################################
# 3. Update Source and R
# ##############################################################################
aptitude update & aptitude safe-ugrade
# ##############################################################################
# 4. Install Latest Version for a new Install needed
# ##############################################################################
aptitude build-dep -y r-base-core
#aptitude install -y r-base 
aptitude install -y r-base-core 
#aptitude install -y r-recommended
#aptitude install -y r-base-dev
#aptitude install -y r-cran-*
#aptitude install -y r-doc-info
#aptitude install -y r-doc-pdf
#aptitude install -y r-doc-html
aptitude install -y r-mathlib
aptitude install -y ess
# ##############################################################################
# 5. Delete the r lib in sourcelist
# ##############################################################################
aptitude update & aptitude safe-ugrade
echo "which R is:" $(which R)
echo "whereis R is:" $(whereis R)
