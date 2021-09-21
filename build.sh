#!/bin/bash
# install Antora
npm i -g @antora/cli @antora/site-generator-default
# install lunr search
npm i -g antora-lunr
cp -r /opt/buildhome/.nvm/versions/node/v12.18.0/lib/node_modules/antora-lunr/supplemental_ui .
cp ./generate-site.js /opt/buildhome/.nvm/versions/node/v12.18.0/lib/node_modules/@antora/site-generator-default/lib/
# transform asciidoctor to HTML
DOCSEARCH_ENABLED=true DOCSEARCH_ENGINE=lunr antora antora-playbook.yml
