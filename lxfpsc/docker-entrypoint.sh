#!/bin/sh

set -o errexit
set -o nounset
set -o pipefail

KPFW_URL_FILE=/app/lxfpsc/url.cnf
KPFW_IP="${KPFW_IP:-127.0.0.1}"
KPFW_PORT="${KPFW_PORT:-8082}"

echo "${KPFW_IP}:${KPFW_PORT}" > ${KPFW_URL_FILE}

exec "$@"
