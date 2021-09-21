#!/bin/bash
# what are we working with?
env | sort
pwd
ls -la
# install Antora
export NODE_VERSION=12
npm i -g @antora/cli @antora/site-generator-default
# install lunr search
npm i -g antora-lunr
#
# where are the node modules
node --version
# fixed path, will break on upgrade
NODE_VERSION=v12.18.0
NODE_MODULES=/opt/buildhome/.nvm/versions/node/$NODE_VERSION/lib/node_modules
# with find
# nope, stacks of matches 
#NODE_MODULES=$(find /opt/buildhome/.nvm -name  node_modules -type d -prune)
# with nvm (node version manager) 
#curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
#NVM_VERSION=$(nvm version)
#NODE_MODULES=/opt/buildhome/.nvm/versions/node/$NVM_VERSION/lib/node_modules
#echo $NODE_MODULES
#
cp -r $NODE_MODULES/antora-lunr/supplemental_ui .
cp ./generate-site.js $NODE_MODULES/@antora/site-generator-default/lib/
# transform asciidoctor to HTML
DOCSEARCH_ENABLED=true DOCSEARCH_ENGINE=lunr antora antora-playbook.yml
