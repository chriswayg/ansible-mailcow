#!/bin/sh
# {{ ansible_managed }}
# Add IPtables rules for Mailserver script /etc/firewall/add_mailserver_fw_rules.sh

# Default policy to drop 'everything'
iptables -P INPUT   DROP

iptables -A INPUT -m state --state INVALID -j DROP

# Allow established connections (the responses to our outgoing traffic)
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow local programs that use loopback (Unix sockets)
iptables -A INPUT -s 127.0.0.0/8 -d 127.0.0.0/8 -i lo -j ACCEPT

# Postfix SMTP, SMTPS, SUBMISSION
iptables -A INPUT -p tcp --dport 25   -m state --state NEW -j ACCEPT
iptables -A INPUT -p tcp --dport 465  -m state --state NEW -j ACCEPT
iptables -A INPUT -p tcp --dport 587  -m state --state NEW -j ACCEPT

# Dovecot IMAP and IMAPS
iptables -A INPUT -p tcp --dport 143  -m state --state NEW -j ACCEPT
iptables -A INPUT -p tcp --dport 993  -m state --state NEW -j ACCEPT

# Dovecot POP3 and POP3S
iptables -A INPUT -p tcp --dport 110  -m state --state NEW -j ACCEPT
iptables -A INPUT -p tcp --dport 995  -m state --state NEW -j ACCEPT

# Dovecot ManageSieve
iptables -A INPUT -p tcp --dport 4190 -m state --state NEW -j ACCEPT

#  Allow HTTP and HTTPS connections from anywhere on normal ports
iptables -A INPUT -p tcp --dport 80  -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

#  Allow SSH connections on port 22 and alternate port 722
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT
iptables -A INPUT -p tcp --dport 722 -m state --state NEW -j ACCEPT

#  Respond to ping requests
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

#  Drop all other inbound
iptables -A INPUT -j DROP
