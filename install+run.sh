#!usr/bin/bash

# Build the Docker images Run the Docker containers
docker-compose up -d --build

docker-compose run web python manage.py makemigrations

docker-compose run web python manage.py migrate

gunzip < clubdb_dump.sql.gz | sudo docker exec -i cleverclub-db-1 psql -U root -d clubdatabase
