#!/usr/bin/env bash

# run alembic migrations
source /var/app/venv/*/bin/activate && {
    gunicorn core.wsgi.application --bind 0.0.0.0:8000
}