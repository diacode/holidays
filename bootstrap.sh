#!/bin/bash

cp config/database.yml.docker-example config/database.yml

docker-compose build web
docker-compose run web rake db:create
docker-compose run web rake db:migrate

docker-compose build webpack
docker-compose run webpack npm install

printf "\n\n"
printf "+===============================================================+\n"
printf "|   Now you are ready to start the app with docker-compose up   |\n"
printf "+===============================================================+\n"
