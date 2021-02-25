#!/bin/bash

echo "******************************************"
echo "  REST API using curl"
echo "******************************************"

encoded_login=$(echo $CONJUR_AUTHN_LOGIN | sed 's/\//%2F/g' )
encoded_varID=$(echo $VARIABLE_ID | sed 's/\//%2F/g' )

refresh_token=$(curl --cacert /etc/conjur.pem -s --header "Accept-Encoding: base64" --data ${CONJUR_AUTHN_API_KEY}  ${CONJUR_APPLIANCE_URL}/authn/${CONJUR_ACCOUNT}/${encoded_login}/authenticate)
secret=$(curl --cacert /etc/conjur.pem -s -H "Authorization: Token token=\"${refresh_token}\"" ${CONJUR_APPLIANCE_URL}/secrets/${CONJUR_ACCOUNT}/variable/${encoded_varID});


echo "CONJUR_APPLIANCE_URL: ${CONJUR_APPLIANCE_URL}"
echo "CONJUR_ACCOUNT: ${CONJUR_ACCOUNT}"
echo "CONJUR_AUTHN_LOGIN: ${CONJUR_AUTHN_LOGIN}"
echo "CONJUR_AUTHN_API_KEY: ${CONJUR_AUTHN_API_KEY}"
echo "VARIABLE_ID: ${VARIABLE_ID}"

echo "The value of ${VARIABLE_ID} is ${secret}"
