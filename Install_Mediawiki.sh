echo "#> Downloading & Configuring prerequisites for MediaWiki."
yum update -y
yum install centos-release-scl
yum install httpd24-httpd rh-php73 rh-php73-php rh-php73-php-mbstring rh-php73-php-mysqlnd rh-php73-php-gd rh-php73-php-xml mariadb-server mariadb
systemctl enable mariadb
systemctl enable httpd 

echo "#> Configuring MariaDB."
mysql_secure_installation
mysql -u root -p
CREATE USER 'god_mode'@'localhost' IDENTIFIED BY 'HuHuH@H@H1H1';
create database mediawiki_database;
GRANT ALL PRIVILEGES ON mediawiki_database.* TO 'god_mode'@'localhost';
FLUSH PRIVILEGES;

echo "#> Verifying if database is installed."
SHOW DATABASES;

echo "#> Verifying GRANTS."
SHOW GRANTS FOR 'wiki'@'localhost';
exit

echo "#> Installing Mediawiki."
mkdir /opt/mediawiki_home
cd /opt/mediawiki_home
wget https://releases.wikimedia.org/mediawiki/1.37/mediawiki-1.37.1.tar.gz
wget https://releases.wikimedia.org/mediawiki/1.37/mediawiki-1.37.1.tar.gz.sig
gpg --verify mediawiki-1.37.1.tar.gz.sig mediawiki-1.37.1.tar.gz

echo "#> Configuring webserver."
cd /var/www
tar -zxf /opt/mediawiki_home/mediawiki-1.37.1.tar.gz
ln -s mediawiki-1.37.1/ mediawiki
chown -R apache:apache /var/www/mediawiki
service httpd restart

echo "#> Configuring firewall."
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=https
systemctl restart firewalld

echo "#> Configure security(Selinux)"
getenforce
restorecon -FR /var/www/mediawiki-1.37.1/
restorecon -FR /var/www/mediawiki
echo "#> Verifying context."
ls -lZ /var/www/
