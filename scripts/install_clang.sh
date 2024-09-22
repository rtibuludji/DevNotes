#!/bin/bash

#
# 2024. Redi Tibuludji
#
set -e

LLVM_VERSION="19.1.0"

# setup the directory for target
mkdir -p ~/.local
export HOMEDEV=~/.local

# working directory is /tmp
cd /tmp

# cleanup
rm -rf llvmorg-${LLVM_VERSION}.tar.gz
rm -rf llvm-project-llvmorg-${LLVM_VERSION}

# download
curl -L -O https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-19.1.0.tar.gz
tar xzvf llvmorg-${LLVM_VERSION}.tar.gz

# build
cd llvm-project-llvmorg-${LLVM_VERSION}
cmake -S llvm -B build -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra" -DCMAKE_INSTALL_PREFIX=${HOMEDEV}/clang
cmake --build build

# install
cmake --install build

# cleanup post-install
cd /tmp
rm -rf llvm-project-llvmorg-${LLVM_VERSION}
rm -rf llvmorg-${LLVM_VERSION}.tar.gz
