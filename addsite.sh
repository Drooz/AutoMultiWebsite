#!/bin/sh

# This will cd into the apache folder IN THIS CASE IT IS RPI3
cd /var/www/html

# Make a folder the the given parameter and cd to it
sudo mkdir $1
cd ./$1

# Will make public_html foler to keep everything organized 
sudo mkdir public_html
cd ./public_html

# copy the default index.php you can remove this part if you don't want to
sudo cp /var/www/html/WEBSITE/public_html/index.php ./

# Print the website name in the index.php
echo $1 >> index.php

# cd to apache config file to add new website
cd /etc/apache2/sites-available

# Start adding the commands YOU MAY CHANGE THE NAME OF FILE WE ARE WRITING ON 000-default.conf OR the PORT
echo "<VirtualHost *:80>" >> 000-default.conf
echo "    ServerAdmin Dr.ooz1996@Gmail.com" >> 000-default.conf
echo "    ServerName "$1 >> 000-default.conf
echo "    ServerAlias www."$1 >> 000-default.conf
echo "    DocumentRoot /var/www/html/"$1"/public_html" >> 000-default.conf
echo "    ErrorLog ${APACHE_LOG_DIR}/error.log" >> 000-default.conf
echo "    CustomLog ${APACHE_LOG_DIR}/access.log combined" >> 000-default.conf
echo "</VirtualHost>" >> 000-default.conf

# Restart the apache service 
sudo service apache2 restart











