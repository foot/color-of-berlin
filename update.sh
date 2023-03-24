#!/usr/bin/env bash

node index.js json > data/today.json
cp data/history.json data/history.json.tmp
jq '. += [input]' data/history.json.tmp data/today.json > data/history.json
rm data/history.json.tmp

color=$(cat data/today.json | jq -r .color)
name=$(cat data/today.json | jq -r .name)
color=$color name=$name envsubst < templates/index.html > data/index.html