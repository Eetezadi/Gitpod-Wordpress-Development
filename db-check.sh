#!/bin/bash
set -e

echo "Waiting for database to become ready..."

while ! docker-compose exec -T gitpod-wordpress-development-db-1 mysqladmin ping -h "localhost" --silent; do
  echo -n "."
  sleep 2
done

echo "Database is ready."
