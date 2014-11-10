#!/bin/bash

if [ $user ]; then
  echo "$user"
else
  echo "no user"
fi

if [ $password ]; then
  echo "$password"
else
  echo "no password"
fi

curl -i -X POST -u $user:$password -H "Content-Type: application/json" -d '{"title": "Arbor created an issue", "body": "this is an empty body", "assignee": "ying8"}'  https://api.github.com/repos/ying8/test-messaging/issues

echo "+++end+++"

#exit 0
