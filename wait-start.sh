#!/bin/sh

set -e
until nc localhost 27017 -z ; do
  echo "Waiting for mongo"
  sleep 1
done
echo "mongo is up"
if [ -n "$DEVHUB_TITLE" ]; then
  exec node app.js -t $DEVHUB_TITLE
else
  exec node app.js
fi

