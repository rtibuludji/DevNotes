#!/bin/bash 

#
# 2025. Redi Tibuludji
#
set -e

TERRAGRUNT_VERSION="v0.69.10"

# setup the directory for target
mkdir -p ~/.local
export HOMEDEV=~/.local

# working directory is /tmp
cd /tmp

# cleanup
rm -rf terragrunt

# download
curl -L "https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64" -o "terragrunt"

# install
mkdir -p ${HOMEDEV}/bin
cp terragrunt ${HOMEDEV}/bin/
chmod +x ${HOMEDEV}/bin/terragrunt

# cleanup post-install
cd /tmp
rm -rf terragrunt
