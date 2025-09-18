#!/bin/bash

# Default behavior is to reboot
REBOOT=true

# Parse arguments
for arg in "$@"; do
  case "$arg" in
    --no-reboot)
      REBOOT=false
      ;;
    -h|--help)
      echo "Usage: $0 [--no-reboot]"
      exit 0
      ;;
    *)
      echo "Unknown option: $arg"
      echo "Usage: $0 [--no-reboot]"
      exit 1
      ;;
  esac
done

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
  if $REBOOT; then
    sudo reboot
  else
    echo "Reboot skipped (due to --no-reboot)."
  fi
else
  exit
fi


