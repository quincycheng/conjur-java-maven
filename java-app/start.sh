#!/bin/bash

# Add self-signed cert to keystore
openssl x509 -outform der -in /etc/conjur.pem -out /etc/conjur-default.der

keytool -importcert -noprompt  \
    -alias conjur-default \
    -keystore "$JAVA_HOME/lib/security/cacerts" \
    -storepass changeit \
    -file /etc/conjur-default.der

# (optional) Test network & parameter using curl
/curl.sh

# Start Java Console App
java --add-opens=java.base/java.net=ALL-UNNAMED \
   --add-opens=java.base/java.lang=ALL-UNNAMED  \
   -jar /app.jar

