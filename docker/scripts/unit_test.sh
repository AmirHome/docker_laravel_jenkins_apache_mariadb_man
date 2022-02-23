#!/bin/sh

  export $(echo $(cat /tmp/.env | sed 's/#.*//g'| xargs))

  docker exec -i ${APP_NAME}-php bash -c "php artisan test --without-tty"
