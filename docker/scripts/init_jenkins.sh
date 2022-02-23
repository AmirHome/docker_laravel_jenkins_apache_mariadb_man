#!/bin/sh

export $(echo $(cat .env | sed 's/#.*//g'| xargs))

# sudo docker logs -f jenkins
docker exec -i ${APP_NAME}-jenkins bash -c "cat /var/jenkins_home/secrets/initialAdminPassword"

