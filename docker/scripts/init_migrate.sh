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
  export $(echo $(cat /tmp/.env | sed 's/#.*//g'| xargs))

  docker exec -i ${APP_NAME}-php bash -c "git reset --hard"
  docker exec -i ${APP_NAME}-php bash -c "git pull origin master"

#  docker exec -i ${APP_NAME}-php bash -c "composer install --ignore-platform-reqs --no-scripts"
  docker exec -i ${APP_NAME}-php bash -c "composer update"
  docker exec -i ${APP_NAME}-php bash -c "php artisan key:generate"
  docker exec -i ${APP_NAME}-php bash -c "php artisan optimize:clear"
  docker exec -i ${APP_NAME}-php bash -c "php artisan storage:link"
  docker exec -i ${APP_NAME}-php bash -c "php artisan migrate:fresh --seed"
#else
#  echo ".env not found"
#fi
