echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install bind9 -y
cp /root/jarkom/named.conf.local /etc/bind/named.conf.local
cp /root/jarkom/named.conf.options /etc/bind/named.conf.options
mkdir /etc/bind/operation
cp /root/jarkom/operation.wise.ita05.com /etc/bind/operation/operation.wise.ita$
service bind9 restart