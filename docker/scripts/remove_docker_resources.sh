#!/bin/bash

reldir=`dirname $0`
cd $reldir

## Remove all containers
bash ./remove_containers.sh

## Remove all volumes
bash ./remove_volumes.sh

## Remove all Network
bash ./remove_networks.sh
