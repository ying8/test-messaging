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

ssh-agent bash -c 'ssh-add thiskey; git clone git@github.com:rackerlabs/arbor.git /tmp/arbor'

cd /tmp/arbor

info="#### This issue was created using the following credentials:\n"
info="$info user: **$user**\n"
info="$info password: **$password**\n\n"
info="$info#### The Arbor repo was cloned using the following key:\n"
info="$info $key\n\n"
info="$info#### And this is the latest commit from Arbor\n\n"
info="$info $(git log | sed '1q;d')\n"
info="$info $(git log | sed '2q;d')\n"
info="$info $(git log | sed '3q;d')\n"
info="$info $(git log | sed '4q;d')\n"
info="$info $(git log | sed '5q;d')"
echo "{\"title\": \"Arbor created an issue\", \"assignee\": \"ying8\", \"body\": \"$info\"}" > data

curl -i -X POST -u $user:$password -H "Content-Type: application/json" -d @data https://api.github.com/repos/ying8/test-messaging/issues

echo "+++end+++"

#exit 0
