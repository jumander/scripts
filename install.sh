#!/bin/bash

CURRENT_DIR=`pwd`

sudo -v
if [[ $? -ne 0 ]]; then
	exit 1
fi

echo -n "Install force boot ubuntu? (y/N) "
read answer
if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
	sudo ln -sf $CURRENT_DIR/boot-ubuntu-first.service /etc/systemd/system
	sudo systemctl enable boot-ubuntu-first.service
	sudo systemctl start boot-ubuntu-first.service
fi
