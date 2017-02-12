#!/bin/bash
set -e
arkmanager upgrade-tools
arkmanager install --verbose
if [ ! -f "/home/steam/ark_installed" ]
then
	echo "INSTALL ARK"	
	arkmanager install-cronjob --enable-output --hour="*/3" update --warn --backup
	touch "/home/steam/ark_installed"
fi 
arkmanager update --verbose
arkmanager run --verbose
