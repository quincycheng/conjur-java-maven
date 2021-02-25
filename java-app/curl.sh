#!/bin/bash

echo "******************************************"
echo "* REST API using curl"
echo "******************************************"

encoded_login=$(echo $CONJUR_AUTHN_LOGIN | sed 's/\//%2F/g' )
encoded_varID=$(echo $VARIABLE_ID | sed 's/\//%2F/g' )

refresh_token=$(curl --cacert /etc/conjur.pem -s --header "Accept-Encoding: base64" --data ${CONJUR_AUTHN_API_KEY}  ${CONJUR_APPLIANCE_URL}/authn/${CONJUR_ACCOUNT}/${encoded_login}/authenticate)
secret=$(curl --cacert /etc/conjur.pem -s -H "Authorization: Token token=\"${refresh_token}\"" ${CONJUR_APPLIANCE_URL}/secrets/${CONJUR_ACCOUNT}/variable/${encoded_varID});

echo "The value of ${VARIABLE_ID} is ${secret}"
