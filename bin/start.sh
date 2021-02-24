#!/bin/bash

./bin/00-check-prerequisties.sh
./bin/01-conjur.sh
./bin/02-build-java-app.sh
./bin/03-run-java-app.sh
