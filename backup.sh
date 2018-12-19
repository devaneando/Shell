#! /bin/bash

cd /home/devaneando/Shell

git update-index -q --refresh
CHANGED=$(git diff-index --name-only HEAD --)
if [ ! -z "${CHANGED}" ]; then
    git add --all --no-ignore-removal
    git commit -m "$(date +'%Y-%m-%d %H:%M')"
    git push --progress origin $(git symbolic-ref --short HEAD)
fi
