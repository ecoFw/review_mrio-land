#!/bin/sh
set -e

git config --global user.email "mk@mklau.info"
git config --global user.name "mklau"

git clone https://github.com/ecoFw/review_mrio-land.git 
cd review_mrio-land
Rscript make.R
git add -A .
git commit -am "Travis make project" 
git push -q origin master
