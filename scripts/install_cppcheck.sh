#!/bin/bash

#
# 2024. Redi Tibuludji
#
set -e

CPPCHECK_VERSION="2.15.0"

# setup the directory for target
mkdir -p ~/.local
export HOMEDEV=~/.local

# working directory is /tmp
cd /tmp

# cleanup
rm -rf ${CPPCHECK_VERSION}.tar.gz
rm -rf cppcheck-${CPPCHECK_VERSION}

# git clone
curl -L -O https://github.com/danmar/cppcheck/archive/refs/tags/2.15.0.tar.gz
tar xzvf ${CPPCHECK_VERSION}.tar.gz


# build
cd cppcheck-${CPPCHECK_VERSION}
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=${HOMEDEV} -DCMAKE_BUILD_TYPE=Release
cmake --build .

# install
cmake --install .

# cleanup post-install
cd /tmp
rm -rf cppcheck-${CPPCHECK_VERSION}
rm -rf ${CPPCHECK_VERSION}.tar.gz
