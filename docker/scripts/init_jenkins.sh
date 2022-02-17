#!/bin/sh

# sudo docker logs -f jenkins
docker exec -it jenkins bash -c "cat /var/jenkins_home/secrets/initialAdminPassword"

