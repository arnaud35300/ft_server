# start from base
FROM debian:buster

# author
MAINTAINER arguilla <arguilla@student.42.fr>

# install vim
RUN apt-get -yqq update && apt-get install -qq -y vim

# install nginx

RUN apt-get -yqq update && apt-get install -qq -y curl vim wget
RUN apt-get update && apt-get install -y -qq nginx
RUN apt-get -y install php7.3-{fpm,common,mysql,gmp,curl,intl,mbstring,xmlrpc,gd,xml,cli,zip,soap,imap}
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
