# Networking_D4ML
Skill Boost task on Networking
As DevOps engineer you need to perform next steps to make more secure our local Mail server with help of Iptables Firewall.


Description:

Keep in mind that IP Addresses could be changed. Show them in your description. For example if your Subnet in AWS have 10.0.0.0/8 CIDR then use IP Addresses from it.

Local subnet is 192.168.42.0/24
Mail server ip: 192.168.42.11
NAT Gateway ip: 192.168.42.255
IT department IP range 192.168.42.200-220
HR department IP range 192.168.42.150-199
Backup server IP: 192.168.42.250
Local DNS server IP: 192.168.42.251
Task:

1. 25 port TCP of mail server should accept connections from internet.
2. 53 port TCP\UDP should be open for outbound connections for DNS use
3. 143 TCP port of mail server must be closed for any connection
4. 993 TCP port should be opened for HR department and Backup server connection
5. 465 TCP port could be accessed by IT department only
6. 587 TCP port must be opened for HR and IT departments only
7. Each evening Backup server used SMB default port to get mail backups from Mail server
8. SSH default port of Mail server should be available for IT department.
9. All other ports, except 443, should be restricted


You can use EC2 t2.micro instance to prepare list of commands which should be executed at mail server side. At the end we need list of commands and "iptables -L" output.


