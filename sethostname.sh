#!/bin/bash

# Ask the user for a new hostname
read -p "Enter the new hostname: " new_hostname

# Check if the input is not empty
if [ -z "$new_hostname" ]; then
    echo "Hostname cannot be empty. Exiting."
    exit 1
fi

# Set the new hostname
sudo hostnamectl set-hostname "$new_hostname"

# Display the new hostname
echo "Hostname set to: $new_hostname"

# Prompt the user to restart for changes to take effect
read -p "Do you want to restart the system to apply the changes? (y/n): " restart_choice

if [ "$restart_choice" == "y" ]; then
	sudo truncate /etc/machine-id --size 0
	sudo systemd-machine-id-setup
	sudo reboot
else
	sudo truncate /etc/machine-id --size 0
	sudo systemd-machine-id-setup
	echo "You can restart your system later for the changes to take effect."
fi

