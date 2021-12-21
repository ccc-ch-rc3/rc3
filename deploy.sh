#!/bin/bash

set -eu -o pipefail
set -x

mkdir dist
tiled --export-map json map.tmx dist/main.json
sed -i 's/..\\\/assets\\\///g' dist/main.json
find . -name \*.png -exec cp {} dist/ \;
cp COPYRIGHT dist/
cp .gitlab-ci.yml dist/

git add dist && git commit -m "Update"
git push origin --delete deploy
git subtree push --prefix dist origin deploy
rm -rf dist
git reset --hard origin/main
