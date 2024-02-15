#!/bin/bash

# install the gnupg, software-properties-common, and curl
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

# get terraform GPG keys
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

# verify keys fingerprint
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

# add hashicorps repository
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

# update
sudo apt update

# install terraform
sudo apt-get install terraform

# verify installation
terraform -help plan
terraform -v

# install terraform auto completion
terraform -install-autocomplete

