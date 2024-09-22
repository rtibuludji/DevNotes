#!/bin/bash 

#
# 2024. Redi Tibuludji
#
set -e

CMAKE_VERSION="3.30.3"

# setup the directory for target
mkdir -p ~/.local
export HOMEDEV=~/.local

# working directory is /tmp
cd /tmp

# cleanup
rm -rf cmake-${CMAKE_VERSION}
rm -rf cmake-${CMAKE_VERSION}.tar.gz

# download
curl -L -O https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}.tar.gz
tar xzvf cmake-${CMAKE_VERSION}.tar.gz
cd cmake-${CMAKE_VERSION}

# install
./bootstrap --prefix=${HOMEDEV}
make
make install 

# cleanup post-install
cd /tmp
rm -rf cmake-${CMAKE_VERSION}
rm -rf cmake-${CMAKE_VERSION}.tar.gz