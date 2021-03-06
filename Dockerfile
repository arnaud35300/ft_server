# start from base
FROM debian:buster

# author
MAINTAINER arguilla <arguilla@student.42.fr>

# install utils
RUN apt-get -yqq update && apt-get install -yqq curl vim wget

# install ssl 
RUN apt-get -yqq update && apt-get install -yqq openssl

# install nginx
RUN apt-get -yqq update && apt-get install -yqq nginx

# install PHP
RUN apt-get -yqq install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap

# install mariadb
RUN apt-get -yqq install mariadb-server

# copy the run script in the container
COPY src/run.sh .

# copy the nginx default configuration file
COPY src/nginx-default .

# copy the wordpress config
COPY src/wp-config.php .

# auto index nginx
ARG AUTOINDEX=on
ENV AUTOINDEX $AUTOINDEX

#run the shell script
ENTRYPOINT bash run.sh
