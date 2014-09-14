
# This file is automatically created by rIntall.org, Do not change here!!!
#!/bin/sh
sudo apt-get update & apt-get upgrade   ## Update the package list
sudo apt-get build-dep -y r-base-core  ## Install the depencies
sudo apt-get install -y r-base-core    ## Install r-base-core
sudo apt-get install -y r-mathlib      ## Math
sudo apt-get install -y ess            ## Emacs ess-mode
sudo apt-get install -y r-doc-html
sudo apt-get install -y r-doc-info
sudo apt-get install -y r-doc-pdf
echo "which R is:" $(which R)
echo "where R is:" $(whereis R)
