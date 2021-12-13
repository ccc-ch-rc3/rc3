#!/bin/bash

set -x

mkdir dist
tiled --export-map json bern.tmx dist/main.json
# sed -i 's/..\\\///g' dist/main.json
find . -name \*.png -exec cp {} dist/ \;
cp COPYRIGHT dist/

git add dist && git commit -m "Update"
git push origin --delete main
git subtree push --prefix dist origin main
rm -rf dist
git reset --hard origin/dev
