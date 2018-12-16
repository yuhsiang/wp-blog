#!/bin/sh

CONTAINER_NAME_WORDPRESS=gym-blog-wordpress
CONTAINER_NAME_MYSQL=gym-blog-mysql

PORT_WORDPRESS=9527
PORT_MYSQL=9506

ROOT_PASSWORD=gymblog

DIR="$(pwd)"

# create dependency files/folders
mkdir www
mkdir db

# remove previous container for docker to run
docker rm -fv $CONTAINER_NAME_WORDPRESS
docker rm -fv $CONTAINER_NAME_MYSQL

# run dockers
docker run --name $CONTAINER_NAME_MYSQL \
    --restart always \
    -v $DIR/db:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=$ROOT_PASSWORD \
    -p $PORT_MYSQL:3306 -d \
    mysql:5.7

docker run --name $CONTAINER_NAME_WORDPRESS \
    --restart always \
    -v $DIR/www:/var/www/html/ \
    -e MYSQL_ROOT_PASSWORD=$ROOT_PASSWORD \
    --link $CONTAINER_NAME_MYSQL:mysql -p $PORT_WORDPRESS:80 -d \
    wordpress

