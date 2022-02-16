#!/bin/bash

## Stop all containers
sudo bash ./stop_containers.sh

## Remove All Network
list=$(docker network ls -f type=custom -q)
if [ ! -z "$list" ]
then
	docker network rm $list
fi

docker network ls -f type=custom