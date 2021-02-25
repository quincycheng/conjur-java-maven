#!/bin/bash

echo "Compile the Java App"
docker-compose build javaapp

echo "Saving settings for App as .env file"
cat > .env << EOF
CONJUR_APPLIANCE_URL=https://proxy
CONJUR_ACCOUNT=default
CONJUR_AUTHN_API_KEY=$(tail -n +2 tmp/my_app_data| jq '.created_roles."default:host:JavaApp/myJavaApp".api_key' -r)
VARIABLE_ID=JavaApp/secretVar
EOF

