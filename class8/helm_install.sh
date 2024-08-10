#!/bin/bash


# Installation documentation
# https://helm.sh/docs/intro/install/

# Remove older version
rm -rf /usr/local/bin/helm

# Download new version 
wget https://get.helm.sh/helm-v3.14.4-linux-amd64.tar.gz

# Unarchive new version
tar xzvf  helm-v3.14.4-linux-amd64.tar.gz

# Move to availably binary
sudo mv linux-amd64/helm   /usr/local/bin/

# Clean up
rm -rf linux-amd64
rm -rf helm-* 

# bash helm_install.sh