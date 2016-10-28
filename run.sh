#!/bin/sh

set -e

if [ "${CONF_FILE_URLS}" != "" ]; then
  mkdir -p /etc/google-fluentd/config.d
  cd /etc/google-fluentd/config.d
  for url in ${CONF_FILE_URLS}; do
    curl -sSO $url -H "Metadata-Flavor: Google"
  done
  # for f in $(ls); do
  #   mv ${f} ${f}.conf
  # done
  cd -
fi

exec google-fluentd
