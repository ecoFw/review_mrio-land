#!/bin/sh
set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "mk@mklau.info"
git config --global user.name "mklau"

git clone https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git 
cd ${TRAVIS_REPO_SLUG}
Rscript make.R
git add -A .
git commit -am "Make project" 
git push -q origin master
