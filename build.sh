#!/bin/bash
# what are we working with?
env | sort
pwd
ls -la
#
# install Antora
npm i -g @antora/cli @antora/site-generator-default
#
# install lunr search
npm i -g antora-lunr
# where are the node modules
# These env vars already exist
#NODE_VERSION=$(node --version)
#HOME=/opt/buildhome
NODE_MODULES=$HOME/.nvm/versions/node/$NODE_VERSION/lib/node_modules
cp -r $NODE_MODULES/antora-lunr/supplemental_ui .
cp ./generate-site.js $NODE_MODULES/@antora/site-generator-default/lib/
#
# transform asciidoctor to HTML
DOCSEARCH_ENABLED=true DOCSEARCH_ENGINE=lunr antora antora-playbook.yml
