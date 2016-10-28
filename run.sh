#!/bin/sh

set -e

if [ "${CONF_FILE_URL}" != "" ]; then
  cd /etc/google-fluentd/config.d && curl -sSO ${CONF_FILE_URL} && cd -
fi

exec google-fluentd
