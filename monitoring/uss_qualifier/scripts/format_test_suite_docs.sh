#!/usr/bin/env bash

set -eo pipefail
set -o xtrace

# Find and change to repo root directory
OS=$(uname)
if [[ "$OS" == "Darwin" ]]; then
	# OSX uses BSD readlink
	BASEDIR="$(dirname "$0")"
else
	BASEDIR=$(readlink -e "$(dirname "$0")")
fi
cd "${BASEDIR}/../../.." || exit 1

if [ -z "${DO_NOT_BUILD_MONITORING}" ]; then
  monitoring/build.sh || exit 1
  export DO_NOT_BUILD_MONITORING=true
fi

# shellcheck disable=SC2086
docker run --name test_suite_docs_formatter \
  --rm \
  -v "$(pwd):/app" \
  -e MONITORING_GITHUB_ROOT=${MONITORING_GITHUB_ROOT:-} \
  interuss/monitoring \
  uss_qualifier/scripts/in_container/format_test_suite_docs.sh "$@"