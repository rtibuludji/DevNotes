#!/bin/bash 

#
# 2025. Redi Tibuludji
#
set -e

TERRAFORM_VERSION="1.12.2"

# setup the directory for target
mkdir -p ~/.local
export HOMEDEV=~/.local

# working directory is /tmp
cd /tmp

# cleanup
rm -rf terraform_${TERRAFORM_VERSION}
rm -rf terraform_${TERRAFORM_VERSION}.zip

# download
curl -L -O https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d terraform_${TERRAFORM_VERSION}
cd terraform_${TERRAFORM_VERSION}

# install
mkdir -p ${HOMEDEV}/bin
cp terraform ${HOMEDEV}/bin/
chmod +x ${HOMEDEV}/bin/terraform


# cleanup post-install
cd /tmp
rm -rf terraform_${TERRAFORM_VERSION}
rm -rf terraform_${TERRAFORM_VERSION}.zip

