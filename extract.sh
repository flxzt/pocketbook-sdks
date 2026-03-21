#!/usr/bin/env bash
set -euxo pipefail

SCRIPT_DIR=$(dirname "$0")
REPO_URL="https://github.com/flxzt/pocketbook-sdks"
SDKS="\
SDK-A13-5.19.7z \
SDK-B288-5.19.7z \
SDK-iMX6-5.19.7z \
SDK-B288-6.5.7z \
SDK-B288-6.8.7z \
SDK-B288-6.10.7z \
SDK-B300-6.10.7z \
"

for sdk in ${SDKS}; do
    curl -LfO "${REPO_URL}/releases/latest/download/${sdk}"
done

for archive in "${SCRIPT_DIR}"/*.7z; do
    echo "Extracting ${archive} to ${archive%.*}"
    rm -rf "${archive%.*}" || true
    7z x -y -snld "${archive}" -o"${archive%.*}" || true
done

