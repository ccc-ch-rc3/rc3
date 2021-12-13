#!/bin/bash

set -eu -o pipefail
set -x

mkdir dist
tiled --export-map json bern.tmx dist/main.json
# sed -i 's/..\\\///g' dist/main.json
find . -name \*.png -exec cp {} dist/ \;
cp COPYRIGHT dist/

git add dist && git commit -m "Update"
git push origin --delete deploy
git subtree push --prefix dist origin deploy
rm -rf dist
git reset --hard origin/main
