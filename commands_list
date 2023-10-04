#!/bin/bash

# Define your variables
local_subnet="192.168.42.0/24"
mail_server_ip="192.168.42.11"
nat_gateway_ip="192.168.42.255"
it_department_ip_range="192.168.42.200/28"
hr_department_ip_range="192.168.42.150/29"
backup_server_ip="192.168.42.250"
local_dns_server_ip="192.168.42.251"

# Your private IPv4 address
your_private_ipv4="172.31.18.211"

# AWS DNS IP (replace with the actual IP)
AWS_DNS_IP="127.0.0.53"

# Allow your own connection
sudo iptables -A INPUT -s $your_private_ipv4 -j ACCEPT

# Flush existing rules and set default policies
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P INPUT ACCEPT

# Allow loopback traffic
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT

# Allow established and related connections
sudo iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# 1. Allow incoming connections to port 25 (SMTP)
sudo iptables -A INPUT -p tcp --dport 25 -j ACCEPT

# Allow outbound DNS connections (port 53 TCP/UDP) to AWS DNS servers
sudo iptables -A OUTPUT -p udp --dport 53 -d $AWS_DNS_IP -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 53 -d $AWS_DNS_IP -j ACCEPT

# 3. Close all connections to port 143 (IMAP)
sudo iptables -A INPUT -p tcp --dport 143 -j DROP

# 4. Allow incoming connections to port 993 (IMAPS) for HR department and Backup server
sudo iptables -A INPUT -s $hr_department_ip_range -p tcp --dport 993 -j ACCEPT
sudo iptables -A INPUT -s $backup_server_ip -p tcp --dport 993 -j ACCEPT

# 5. Allow incoming connections to port 465 (SMTPS) for IT department
sudo iptables -A INPUT -s $it_department_ip_range -p tcp --dport 465 -j ACCEPT

# 6. Allow incoming connections to port 587 (SMTP) for HR and IT departments
sudo iptables -A INPUT -s $hr_department_ip_range -p tcp --dport 587 -j ACCEPT
sudo iptables -A INPUT -s $it_department_ip_range -p tcp --dport 587 -j ACCEPT

# 7. Allow incoming SMB connections from the Backup server each evening (18:00-21:00)
sudo iptables -A INPUT -s $backup_server_ip -p tcp -m multiport --sports 137:139 -m time --timestart 18:00 --timestop 21:00 -j ACCEPT
sudo iptables -A INPUT -s $backup_server_ip -p udp -m multiport --sports 137:139 -m time --timestart 18:00 --timestop 21:00 -j ACCEPT

# 8. Allow SSH access (default port 22) for IT department
sudo iptables -A INPUT -s $local_subnet -p tcp --dport 22 -j ACCEPT

# 9. Restrict all other incoming connections (except port 443)
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables -A INPUT -j DROP

# Checking if everything is working
sudo iptables -L
