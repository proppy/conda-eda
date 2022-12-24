#!/bin/bash

set -e
set -x

# Identify OS
UNAME_OUT="$(uname -s)"
case "${UNAME_OUT}" in
    Linux*)     OS=Linux;;
    *)          OS="${UNAME_OUT}"
                echo "Unknown OS: ${OS}"
                exit;;
esac

./autogen.sh
./configure --prefix="${PREFIX}" --disable-debug
make V=1 -j$CPU_COUNT
make V=1 install