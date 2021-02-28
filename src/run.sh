#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

display_msg () {
	[[ $# -ne 2 ]] && return 2;
	printf "${*}${NC}\n"
}

# ssl
display_msg $GREEN "Generation du certificat SSL."
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/site.pem -keyout /etc/nginx/ssl/site.key -subj "/C=FR/ST=Paris/L=Paris/O=42Paris/OU=arguilla/CN=site" &> /dev/null

# website
mkdir /var/www/site && touch /var/www/site/index.php
echo "<h1>Bienvenue !</h1><p>Si un nombre aleatoire s'affiche, c'est que PHP fonctionne.</p><h2><?= rand(0,100); ?></h2>" >> /var/www/site/index.php

# nginx
display_msg $GREEN "Mise en place du fichier de configuration nginx."
mv nginx-default /etc/nginx/sites-available/site
ln -s /etc/nginx/sites-available/site /etc/nginx/sites-enabled/site
rm -rf /etc/nginx/sites-enabled/default
if [ $AUTOINDEX = "off" ]; then
	sed -i "s/autoindex on/autoindex off/" /etc/nginx/sites-enabled/site
fi
display_msg $GREEN "Permissions du serveur pour site."
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

# mySQL
service mysql start
display_msg $GREEN "Creation de la base de donnees."
echo "CREATE DATABASE wordpress" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root
echo "GRANT ALL ON *.* TO 'arguilla'@'localhost' IDENTIFIED BY 'password';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

# phpMyAdmin
display_msg $GREEN "Installation et configuration de PhpMyAdmin."
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz &> /dev/null
tar -zxvf phpMyAdmin-5.0.2-all-languages.tar.gz &> /dev/null
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
mv phpmyadmin /var/www/site
cp -rp /var/www/site/phpmyadmin/config.sample.inc.php /var/www/site/phpmyadmin/config.inc.php &> /dev/null
mkdir /var/www/site/phpmyadmin/tmp
chmod 777 /var/www/site/phpmyadmin/tmp
sed -i "s/\['AllowNoPassword'\] = false/\['AllowNoPassword'\] = true/;s/\['blowfish_secret'\] = ''/\['blowfish_secret'\] = '\\\$2a\\\$10\\\$yaICXFXOD0xLQgfHdAsdfuLCqxGdIzooX3zNtE6dd1mir4EcLJpvO'/;/^\\\$cfg\['SaveDir'\].*/a \\\$cfg\['TempDir'\] = '/var/www/site/phpmyadmin/tmp';" /var/www/site/phpmyadmin/config.inc.php

# wordpress
wget https://wordpress.org/latest.tar.gz &> /dev/null
tar -xvf latest.tar.gz &> /dev/null
mv wordpress /var/www/site/
mv wp-config.php /var/www/site/wordpress
#chown -R www-data: www-data /var/www/site/wordpress

# service nginx
display_msg $GREEN "Lancement du serveur nginx."
service nginx start

# service php-fpm
display_msg $GREEN "Lancement de PHP."
service php7.3-fpm start

# start the shell
display_msg ${GREEN} "Bienvenue!"
bash
