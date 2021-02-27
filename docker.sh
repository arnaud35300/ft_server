#!bin/sh

docker build -t arguilla42/ft_server .
docker run -it 8888:80 arguilla42/ft_server:latest
