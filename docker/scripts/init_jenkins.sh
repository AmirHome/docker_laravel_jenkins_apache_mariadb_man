#!/bin/sh

docker exec -it jenkins bash -c "cat /var/jenkins_home/secrets/initialAdminPassword"

