
### This file is automaticlly created by linuxInstall.org, do not change!!!
#!/bin/sh
## gdal: libgdal libgdal-dev libgdal1 libgdal1-dev python-gdal
dpkg -l | grep gdal | cut -c-72
sudo apt-get install -y libgdal1-dev
## proj-4: proj-devel, proj-nad, proj-epsg,libproj-dev
sudo apt-get install -y libproj-dev libgeos libgeos-dev

sudo apt-file update
# R CMD INSTALL 
