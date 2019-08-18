#!/usr/bin/env bash
set -e

SLASHED_PREFIX="get-ready$(pwd)"
UPPER_PREFIX=${SLASHED_PREFIX//\//__}
PREFIX=$(echo $UPPER_PREFIX | tr '[:upper:]' '[:lower:]')

IMAGE_NAME=${PREFIX}__image
CONTAINER_NAME=${PREFIX}__container

RUNNING_CONTAINERS=$(docker ps)

if [ "$1" == "stop" ]; then
    docker stop $CONTAINER_NAME
    exit
fi

if [[ $RUNNING_CONTAINERS != *$CONTAINER_NAME* ]]; then
    docker build -t get-ready/base -f ~/.config/get-ready/default/Dockerfile ~/.config/get-ready/default
    docker build -t $IMAGE_NAME .
    docker run -d -it --rm -v $(pwd):/src --name $CONTAINER_NAME $(cat ~/.config/get-ready/default/dockeropts) $IMAGE_NAME 
fi

if [ ! -z "$1" ]; then
    docker exec -it $CONTAINER_NAME $1
fi