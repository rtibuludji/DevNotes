#!/bin/bash

#
# 2024. Redi Tibuludji
#
set -e

OPENSSL_VERSION="3.3.2"

# setup the directory for target
mkdir -p ~/.local
export HOMEDEV=~/.local

# working directory is /tmp
cd /tmp

# cleanup
rm -rf openssl-${OPENSSL_VERSION}
rm -rf openssl-${OPENSSL_VERSION}.tar.gz

# download
curl -L -O https://github.com/openssl/openssl/archive/refs/tags/openssl-${OPENSSL_VERSION}.tar.gz
tar xzvf openssl-${OPENSSL_VERSION}.tar.gz
mv openssl-openssl-${OPENSSL_VERSION} openssl-${OPENSSL_VERSION}
cd openssl-${OPENSSL_VERSION}

# build and install
./Configure enable-fips --prefix=${HOMEDEV} --openssldir=${HOMEDEV}/ssl 
make 
make test
make install