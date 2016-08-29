#!/bin/bash
set -e

if [ "$1" = 'icecast' ]; then
    perl -pi -e 's/\$\{(\w+)\}/$ENV{$1}/g' /etc/icecast2/icecast.xml

    exec gosu icecast2 "$@"
fi

exec "$@"
