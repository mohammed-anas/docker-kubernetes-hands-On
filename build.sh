#!/usr/bin/env bash
set -e

TAG=1.10.0
build() {
    NAME=$1
    IMAGE=anas/flink-$NAME:$TAG
    cd $1
    echo '--------------------------' building $IMAGE in $(pwd)
    sudo docker build -t $IMAGE .
    cd -
}
sudo docker-compose kill
build base
build master
build worker
sudo docker-compose up
