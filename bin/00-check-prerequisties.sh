#!/bin/bash

if ! [ -x "$(command -v docker)" ]; then
  echo 'Error: docker is not installed.' >&2
  exit 1
fi
if ! [ -x "$(command -v docker-compose)" ]; then
  echo 'Error: docker-compose is not installed.' >&2
  exit 1
fi
if ! [ -x "$(command -v cut)" ]; then
  echo 'Error: cut is not installed.' >&2
  exit 1
fi
if ! [ -x "$(command -v tr)" ]; then
  echo 'Error: tr is not installed.' >&2
  exit 1
fi
if ! [ -x "$(command -v tee)" ]; then
  echo 'Error: tee is not installed.' >&2
  exit 1
fi

echo 'All prerequisites have been installed'
