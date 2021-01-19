#!/bin/bash

if [ $# -eq 0 ]; then
	echo "arg needed"
elif [ $1 = "on" ]; then
	sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-available/localhost
	service nginx reload
	echo "autoindex is on"
elif [ $1 = "off" ]; then
	sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-available/localhost
	service nginx reload
	echo "autoindex is off"
else
	echo "arg must be on or off"
fi
