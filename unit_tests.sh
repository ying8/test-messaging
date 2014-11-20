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

echo "****end phase one****"

./call.sh

exit 0
