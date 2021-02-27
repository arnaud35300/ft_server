# start from base
FROM debian:buster

# author
MAINTAINER arguilla <arguilla@student.42.fr>

# install vim
RUN apt-get -yqq update && apt-get install -qq -y vim

# install nginx

RUN apt-get -yqq update && apt-get install -qq -y curl vim wget
RUN apt-get update && apt-get install -y -qq nginx
#RUN apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap
#RUN apt-get -y install mariadb-server
# install ssl 
#RUN apt-get update && apt-get install -qq -y openssl

#copy run script in the container
COPY src/run.sh .

# copy the nginx default configuration file
COPY src/nginx-default .

# expose port
EXPOSE 81
EXPOSE 8888
EXPOSE 443

#run the shell script
ENTRYPOINT bash run.sh
