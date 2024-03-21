#!/bin/bash
set -e

chmod 600 /root/.pg_service.conf
chmod 600 /root/.pgpass
python manage.py migrate
cmd="$@"
exec $cmd
