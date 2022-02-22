#!/bin/sh

#  pipeline {
#      agent any
#
#      stages {
#          stage('Initial Laravel') {
#              steps {
#
#                  sh 'sh /home/scripts/init_laravel.sh'
#              }
#          }
#      }
#  }

#if [ -f src/.env ]
#then
  export $(echo $(cat /src/.env | sed 's/#.*//g'| xargs))

#  docker exec -i ${APP_NAME}-php bash -c "sudo rm -rf ./docker_data/*"
  docker exec -i ${APP_NAME}-php bash -c "sudo rm -rf ./src && mkdir src"
#  docker exec -i ${APP_NAME}-php bash -c "sudo chown 1000:1000 ./docker_data/ -R"
#  docker exec -i ${APP_NAME}-php bash -c "sudo chown 1000:1000 /var/run/docker.sock"
  docker exec -i ${APP_NAME}-php bash -c "git clone git@github.com:AmirHome/hibes_admin.git ."

  docker exec -i ${APP_NAME}-php bash -c "composer install --ignore-platform-reqs --no-scripts"
  docker exec -i ${APP_NAME}-php bash -c "php artisan key:generate"
  docker exec -i ${APP_NAME}-php bash -c "php artisan optimize:clear"
  docker exec -i ${APP_NAME}-php bash -c "php artisan migrate:fresh --seed"
#else
#  echo ".env not found"
#fi
