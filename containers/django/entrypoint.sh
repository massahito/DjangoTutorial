#!/bin/bash
cd ./django-code/${PROJECT_DIR}
echo "PATH=${PATH}:/root/.local/bin/" >> ~/.bashrc
source ~/.bashrc
poetry run python manage.py makemigrations
poetry run python manage.py migrate 
if [ "$DEBUG" = "1" ]; then
	cmd="poetry run python manage.py runserver 0.0.0.0:8000"
else
	cmd="poetry run gunicorn ${PROJECT_DIR}.wsgi:application --bind 0.0.0.0:8000"
fi

exec $cmd
