#!/bin/sh

# sudo docker logs -f jenkins
docker exec -i jenkins bash -c "cat /var/jenkins_home/secrets/initialAdminPassword"

