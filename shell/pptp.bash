sudo apt-get install pptpd
#change /etc/pptpd.conf
#localip 192.168.0.1
#remoteip 192.168.0.100-110

#change /etc/ppp/pptpd-options
#ms-dns 8.8.8.8
#ms-dns 8.8.4.4
#change /etc/ppp/chap-secrets

#sudo service pptpd restart
#change /etc/sysctl.conf
#net.ipv4.ip_forward=1
#sudo sysctl -p
#sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQURADE
#put this into /etc/rc.local sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

