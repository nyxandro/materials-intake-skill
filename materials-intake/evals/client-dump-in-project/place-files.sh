#!/usr/bin/env bash
set -eu
cp -R "$(dirname "$0")/files/." .
# Git config files are kept under fixture names, so they do not act on the skill's own repository.
mv gitignore.fixture .gitignore
# The project is a git repository; the materials the owner dropped into the root are not committed.
git init -q
git add package.json README.md .gitignore src config docs
git -c user.name=owner -c user.email=owner@example.com commit -qm "Project"
