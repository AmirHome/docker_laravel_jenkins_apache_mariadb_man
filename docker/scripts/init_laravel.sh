#!/bin/sh

# bash docker/scripts/remove_docker_resources.sh && sudo chown 1000:1000 ./docker_data/ -R
# docker-compose up --build -d
# docker exec -it hibes_admin-php-app bash -c "bash docker/scripts/init_laravel.sh"
# docker exec -it jenkins bash -c "bash docker/scripts/init_jenkins.sh"

cd /var/www/html
composer install --ignore-platform-reqs --no-scripts
php artisan key:generate
php artisan optimize:clear
php artisan migrate:fresh --seed

