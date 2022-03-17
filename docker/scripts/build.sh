#!/bin/sh

###  php artisan migrate with seed   #####################
#    public function up()
#    {
#        //schema migrations here
#
#        //now the data migration
#        Artisan::call('db:seed', [
#            '--class' => MigrationSpecificSeeder::class,
#        ]);
#    }

  export $(echo $(cat /tmp/.env | sed 's/#.*//g'| xargs))

  docker exec -i ${APP_NAME}-php bash -c "git reset --hard"
  docker exec -i ${APP_NAME}-php bash -c "git pull origin master"

  docker exec -i ${APP_NAME}-php bash -c "php artisan optimize:clear"
  docker exec -i ${APP_NAME}-php bash -c "php artisan migrate"
#else
#  echo ".env not found"
#fi
