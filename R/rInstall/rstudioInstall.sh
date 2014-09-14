#!/bin/bash
sudo apt-get install gdebi-core
sudo apt-get install libapparmor1  # Required only for Ubuntu, not Debian
wget http://download2.rstudio.org/rstudio-server-0.98.501-amd64.deb
sudo gdebi rstudio-server-0.98.501-amd64.deb
