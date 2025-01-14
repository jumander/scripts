#!/bin/bash

if ["$(efibootmgr | grep -oP '^BootOrder: \K\d+')" != "0001"]; then
  efibootmgr -o 0001,0000
fi
