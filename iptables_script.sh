#!/bin/bash

# This script configures iptables rules for network security.
# Usage: bash iptables_script.sh

# Ensure execute permission is set:
sudo chmod +x iptables_script.sh

# Open the script in the nano text editor for editing and add content from commands_list.sh
sudo nano iptables_script.sh

# Execute the script:
sudo ./iptables_script.sh

# Display current rules for verification
echo "Current iptables rules:"
sudo iptables -L
