#!/bin/bash

# 
if [ -e /html/VERSION ]; then
  echo "[entrypoint.sh] VERSION found. `cat /html/VERSION`"
else
  echo "[entrypoint.sh] VERSION not found. copying from /base"
  cp -rv /base/* /html/
  chown -R www-data.www-data /html
  chmod go+rwx /html/
fi

exec php-fpm
