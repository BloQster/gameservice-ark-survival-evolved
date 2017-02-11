#!/bin/bash
set -e
arkmanager upgrade-tools
if [ ! -f "/home/steam/ark_installed" ]
then
	echo "INSTALL ARK"
	arkmanager install --verbose
	arkmanager install-cronjob --enable-output --hour="*/3" update --warn --backup
	touch "/home/steam/ark_installed"
fi 

arkmanager update --verbose
arkmanager run --verbose