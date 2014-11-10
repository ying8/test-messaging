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

echo "$key" > thiskey

chmod 0600 thiskey

ssh-agent bash -c 'ssh-add thiskey; git clone git@github.com:rackerlabs/arbor_labs.git'

cd arbor_labs

info=$(git log | head -n 6)

echo "$info"

curl -i -X POST -u $user:$password -H "Content-Type: application/json" -d '{"title": "Arbor created an issue", "body": "this is an empty body", "assignee": "ying8"}'  https://api.github.com/repos/ying8/test-messaging/issues

echo "+++end+++"

#exit 0
