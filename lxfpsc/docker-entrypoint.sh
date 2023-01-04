#!/bin/sh

set -o errexit
set -o nounset
set -o pipefail

KPFW_URL_FILE=/app/lxfpsc/url.cnf
KPFW_URL="${KPFW_URL:-127.0.0.1}"
KPFW_PORT="${KPFW_PORT:-8082}"

[[ -f ${KPFW_URL_FILE} ]] && rm -rf ${KPFW_URL_FILE}
echo "${KPFW_URL}:${KPFW_PORT}" > ${KPFW_URL_FILE}

/app/lxfpsc/lxfpsc init

exec "$@"
