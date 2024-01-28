#!/bin/bash
set -e

echo "Waiting for database to become ready..."

while ! docker-compose exec -T mariadb mysql -uroot -p"rootpassword" -e 'SELECT 1' --silent; do
  echo -n "."
  sleep 2
done

echo "Database is ready."
