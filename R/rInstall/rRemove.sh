#!/bin/bash
sudo aptitude remove r-base-core
sudo aptitude remove r-base
sudo aptitude remove r-base-dev
dpkg -l | grep ^ii | awk '$2 ~ /^r-/ { print $2 }' | xargs sudo aptitude remove --purge -y
###   remove R exeute and R CMD completion
sudo rm /bin/R
sudo rm /usr/bin/R
sudo rm /usr/local/bin/R
sudo rm /opt/local/bin/R
sudo rm /etc/bash_completion.d/R
sudo rm /etc/bash_completion.d/R*


###   remove R lib and site-lib
sudo rm -rvf /usr/lib/R/
# /usr/lib/R/bin/R
# /usr/lib/R/etc/ldpaths

sudo rm -rvf /usr/local/lib/R/
sudo rm -rvf /usr/local/lib/R/library
sudo rm -rvf /usr/local/lib/R/site-library
sudo rm -rvf /opt/local/lib/R/
###   remove R help file
sudo rm -rvf /usr/share/R
sudo rm -vf  /usr/share/man/man1/R.1.gz
# /usr/share/R/include
###  remove R env
sudo rm -rvf /etc/R/
sudo rm -vf /etc/Renviron
sudo rm -vf /etc/Rprofile
# sudo rm ~/.Rprofile
# sudo rm ~/.Renviron
# sudo rm ~/.RData
# sudo rm ~/.RHistory
echo "which R is:" $(which R)
echo "whereis R is:" $(whereis R)
