#!/bin/bash

docker-compose down
docker-compose pull

echo "Generating Data Key..."
docker-compose run --no-deps --rm conjur data-key generate > tmp/data_key
export CONJUR_DATA_KEY="$(< tmp/data_key)"

echo "Starting Conjur..."
docker-compose up -d openssl database conjur proxy client

echo "Creating Account..."
docker-compose exec conjur conjurctl account create default | tee tmp/admin_data

echo "Logging in as Admin..."
#docker-compose exec client bash -c "echo yes | conjur init -u http://conjur -a default"
docker-compose exec client bash -c "echo yes | conjur init -u https://proxy -a default"
docker-compose exec client conjur authn login -u admin -p "$(grep API tmp/admin_data | cut -d: -f2 | tr -d ' \r\n')"

echo "Loading Policy..."
docker-compose exec client conjur policy load root policy/demo.yml | tee tmp/my_app_data

echo "Saving Secret: ThisIsTheSecret..."
docker-compose exec client conjur variable values add JavaApp/secretVar ThisIsTheSecret

