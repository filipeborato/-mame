#!/usr/bin/env sh
set -eu

if [ -d /usr/local/share/fonts/windows ]; then
  fc-cache -f /usr/local/share/fonts/windows >/dev/null 2>&1 || fc-cache -f
fi

exec "$@"
