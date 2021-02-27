# start from base
FROM debian:buster

# author
MAINTAINER arguilla <arguilla@student.42.fr>

# install nginx
RUN apt-get -yqq update && apt-get install -qq -y \
		curl \
		gnupg2 \
		ca-certificates \
		lsb-release
RUN echo "deb http://nginx.org/packages/debian `lsb_release -cs` nginx" \
    |  tee /etc/apt/sources.list.d/nginx.list
RUN curl -fsSL https://nginx.org/keys/nginx_signing.key |  apt-key add -
RUN  apt-key fingerprint ABF5BD827BD9BF62
RUN apt-get update && apt-get install -y -qq nginx

#copy run script in the container
COPY src/run.sh .

# expose port
EXPOSE 81
EXPOSE 8888
EXPOSE 443

#run the shell script
ENTRYPOINT bash run.sh
