#!/bin/bash

# See https://nodejs.org/ko/download/ for latest version

# vars
VERSION=v14.16.0
DIR=~

# Download and extract
wget https://nodejs.org/dist/${VERSION}/node-${VERSION}-linux-x64.tar.xz nodejs.tar.xz
tar -vxf node-${VERSION}-linux-x64.tar.xz --directory ${DIR}

# cretae symbolic links
sudo ln -sf ${DIR}/node-${VERSION}-linux-x64/bin/node /usr/local/bin/node
sudo ln -sf ${DIR}/node-${VERSION}-linux-x64/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm
sudo ln -sf ${DIR}/node-${VERSION}-linux-x64/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx

# Check
node -v
npm -v
npx -v

# Clean
rm node-${VERSION}-linux-x64.tar.xz