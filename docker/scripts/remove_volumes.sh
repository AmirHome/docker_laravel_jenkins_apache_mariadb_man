#!/bin/bash

## Stop all containers
bash ./stop_containers.sh

## Remove All Volumes
list=$(docker volume ls -q)
if [ ! -z "$list" ]
then
	docker volume rm $list
fi

docker volume ls