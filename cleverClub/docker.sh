#!usr/bin/bash

# Build the Docker images
docker-compose build

# Run the Docker containers
docker-compose up

docker-compose run web python manage.py migrate

docker-compose run web python manage.py createsuperuser
