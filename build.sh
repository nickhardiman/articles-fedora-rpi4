#!/bin/bash
# install Antora
npm i -g @antora/cli @antora/site-generator-default
# install lunr search
npm i -g antora-lunr
# something like /opt/buildhome/.nvm/versions/node/v12.18.0/lib/node_modules
#NODE_MODULES=$(find /opt/buildhome/.nvm -name  node_modules -type d -prune)
NVM_VERSION=$(nvm version)
NODE_MODULES=/opt/buildhome/.nvm/versions/node/$NVM_VERSION/lib/node_modules
echo $NODE_MODULES
cp -r $NODE_MODULES/antora-lunr/supplemental_ui .
cp ./generate-site.js $NODE_MODULES/@antora/site-generator-default/lib/
# transform asciidoctor to HTML
DOCSEARCH_ENABLED=true DOCSEARCH_ENGINE=lunr antora antora-playbook.yml
