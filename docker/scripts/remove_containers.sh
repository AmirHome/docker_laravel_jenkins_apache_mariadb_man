#!/bin/bash

## Stop all containers
sudo bash ./stop_containers.sh

## Remove all containers
list=$(docker ps -a -q)
if [ ! -z "$list" ]
then
	docker rm -f $list
fi

docker ps -a