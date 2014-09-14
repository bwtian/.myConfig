#!/bin/bash
# ##############################################################################
# Setup Renviron for Dropbox Library and Default programs
# ##############################################################################
#sudo cp /etc/R/Renviron /etc/R/Renviron.$(date +%F)
#sudo cp /etc/R/Renviron 
#gedit ~/Dropbox/config/Rconfig/Renviron/linux.Renviron.$(date +%F)
sudo mkdir -p /etc/R
sudo \ln -sfv ~/Dropbox/config/Rconfig/Renviron/Renviron.R  /etc/R/Renviron
