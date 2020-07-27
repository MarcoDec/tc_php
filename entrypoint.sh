#!/bin/sh
if [ $(whoami) = 'root' ]; then
  service cron start
else
  echo 'user' | sudo -S service cron start
fi

set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
        set -- php-fpm "$@"
fi

exec "$@"
