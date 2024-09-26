#!/bin/bash

while true
do
  export DATUM="('`date -u "+%Y-%m-%d %H:%M:%S"`', '`uuidgen`')"
  echo $DATUM
  echo $DATUM | curl "http://localhost:8123/?query=INSERT+INTO+logs.events+VALUES" --data-binary "@-"
  sleep $((1 + $RANDOM % 10))
done


