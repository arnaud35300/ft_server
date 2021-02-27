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
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42Paris/OU=arguilla/CN=localhost"

#nginx
display_msg $GREEN "Mise en place du fichier de configuration nginx."
mv nginx-default /etc/nginx/sites-available
mv /etc/nginx/sites-available/nginx-default /etc/nginx/sites-available/default

# service start
display_msg $GREEN "Lancement du serveur nginx."
service nginx start

# start the shell
display_msg ${GREEN} "Welcome in my container!"
bash
