#!/usr/bin/env bash
set -eu
cp -R "$(dirname "$0")/files/." .
# Git config files are kept under fixture names, so they do not act on the skill's own repository.
mv gitattributes.fixture .gitattributes
mv gitignore.fixture .gitignore
# inbox/ was filed earlier under an old rule that sent everything in it through Git LFS.
# The new chat export the owner dropped into the root is not committed.
git init -q
git lfs install --local >/dev/null
git add .gitattributes .gitignore package.json README.md inbox
git -c user.name=owner -c user.email=owner@example.com commit -qm "Project and filed materials"
