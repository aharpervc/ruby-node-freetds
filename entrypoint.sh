#!/bin/sh
set -e

# don't do anything if this directory (aka volume mount) doesn't exist
if [ ! -d "/tmp/.ssh" ]; then
    exec "$@"
    exit
fi

cp -R /tmp/.ssh /root/.ssh

chmod 700 /root/.ssh
chmod 644 `ls /root/.ssh/*.pub`
chmod 600 `ls /root/.ssh/*_rsa`

exec "$@"
