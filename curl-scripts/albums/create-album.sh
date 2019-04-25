#!/bin/bash

curl "http://localhost:4741/albums" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "album": {
      "title": "'"${TITLE}"'",
      "artist": "'"${ARTIST}"'"
    }
  }'

echo
