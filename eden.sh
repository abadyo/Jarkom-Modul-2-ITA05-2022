echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get install apache2 -y
apt-get install php -y
apt-get install wget -y
apt-get install unzip -y
service apache2 start
cp /root/wise.ita05.com.conf /etc/apache2/sites-available/wise.ita05.com.conf 
a2ensite wise.ita05.com  
service apache2 reload
cd /var/www
mkdir wise.ita05.com
cp /root/index.php /var/www/wise.ita05.com/index.php
cp /root/home /var/www/wise.ita05.com/home.html
apt-get install libapache2-mod-php7.0 -y
service apache2 restart
cp /root/eden.wise.ita05.com.conf /etc/apache2/sites-available/eden.wise.ita05.com.conf
cd /var/www
mkdir eden.wise.ita05.com
a2ensite eden.wise.ita05.com.conf
service apache2 reload
cp /root/wise/* /var/www/wise.ita05.com/
cp -R /root/feden/* /var/www/eden.wise.ita05.com/
cp /root/strix.operation.wise.ita05.com.conf /etc/apache2/sites-available/strix.operation.wise.ita05.com.conf
a2ensite strix.operation.wise.ita05.com.conf
service apache2 reload
cp /root/ports.conf /etc/apache2/ports.conf
cp /root/000-default.conf /etc/apache2/sites-available/000-default.conf
a2enmod rewrite
service apache2 restart
mkdir /var/www/strix.operation.wise.ita05.com
htpasswd -b -c /var/www/strix.operation.wise.ita05 Twilight opStrix
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1bgd3B6VtDtVv2ouqyM8wLyZGzK5C9maT' -O /root/strix.zip
unzip /root/strix.zip -d /root/ -n
cp /root/strix.operation.wise/* /var/www/strix.operation.wise.ita05.com 
cp /root/.htaccess /var/www/eden.wise.ita05.com/.htaccess