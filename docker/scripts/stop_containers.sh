#!/bin/bash

## Stop all containers
list=$(docker ps -a -q)

if [ ! -z "$list" ]
then
	docker stop $list
fi

## Remove all images
# docker rmi $(docker images -a -q)