echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install bind9 -y
cp /root/jarkom/named.conf.local /etc/bind/named.conf.local
mkdir /etc/bind/wise
cp /root/jarkom/wise.ita05.com /etc/bind/wise/wise.ita05.com
cp /root/jarkom/3.42.10.in-addr.arpa /etc/bind/wise/3.42.10.in-addr.arpa
cp /root/jarkom/named.conf.options /etc/bind/named.conf.options
service bind9 restart