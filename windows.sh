#!/bin/bash

if ! sudo -v; then
  exit 1
fi

read -p "Are you sure you want to switch to Windows? (y/N): " response

# Convert the response to lowercase and check
response=$(echo "$response" | tr '[:upper:]' '[:lower:]')

if [[ "$response" == "y" || "$response" == "yes" ]]; then
  # Use the following command to list the windows drive first
  # sudo efibootmgr
  sudo efibootmgr -o 0000,0001
  sudo reboot
else
  exit
fi


