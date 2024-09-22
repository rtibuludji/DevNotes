#!/bin/bash

#
# 2024. Redi Tibuludji
#
set -e

NINJA_VERSION="1.12.1"

# setup the directory for target
mkdir -p ~/.local
export HOMEDEV=~/.local

# working directory is /tmp
cd /tmp

# cleanup
rm -rf ninja-${NINJA_VERSION}
rm -rf v${NINJA_VERSION}.tar.gz

# download
curl -L -O https://github.com/ninja-build/ninja/archive/refs/tags/v${NINJA_VERSION}.tar.gz
tar xzvf v${NINJA_VERSION}.tar.gz
cd ninja-${NINJA_VERSION}

# build
cmake -Bbuild-cmake -H.
cmake --build build-cmake
./build-cmake/ninja_test 

# install
cp ./build-cmake/ninja ${HOMEDEV}/bin/.

# cleanup post-install
cd /tmp
rm -rf ninja-${NINJA_VERSION}
rm -rf v${NINJA_VERSION}.tar.gz