#!/bin/bash

CURRENT_DIR=`pwd`

sudo -v
if [[ $? -ne 0 ]]; then
	exit 1
fi

echo -n "Install force boot ubuntu? (y/N) "
read answer
if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
	sudo ln -sf $CURRENT_DIR/boot-ubuntu-first.sh /usr/local/bin
	sudo ln -sf $CURRENT_DIR/boot-ubuntu-first.service /etc/systemd/system
	sudo systemctl enable boot-ubuntu-first.service
	sudo systemctl start boot-ubuntu-first.service
fi

echo -n "Install gamepad connection triggers gamemode? (y/N) "
read answer
if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
	ln -sf $CURRENT_DIR/gamepad-connection-handler.service ~/.config/systemd/user/
	ln -sf $CURRENT_DIR/gamepad-connection-handler.path ~/.config/systemd/user/
	systemctl --user daemon-reload
	systemctl --user enable --now gamepad-connection-handler.path
	sudo ln -sf $CURRENT_DIR/99-xbox-bt.rules /etc/udev/rules.d/
	sudo udevadm control --reload-rules
fi
