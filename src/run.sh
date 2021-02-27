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
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/site.pem -keyout /etc/nginx/ssl/site.key -subj "/C=FR/ST=Paris/L=Paris/O=42Paris/OU=arguilla/CN=site"

# website
mkdir /var/www/site && touch /var/www/site/index.php
echo "<h1>Bienvenue !</h1><?= phpinfo(); ?>" >> /var/www/site/index.php

# nginx
display_msg $GREEN "Mise en place du fichier de configuration nginx."
mv nginx-default /etc/nginx/sites-available/site
ln -s /etc/nginx/sites-available/site /etc/nginx/sites-enabled/site
rm -rf /etc/nginx/sites-enabled/default
display_msg $GREEN "Permissions du serveur pour site."
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

# service start
display_msg $GREEN "Lancement du serveur nginx."
service nginx start

# start the shell
display_msg ${GREEN} "Bienvenue!"
bash
