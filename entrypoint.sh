#!/bin/bash
set -e

mkdir public
git submodule init
git submodule update

echo "#################################################"
echo "Starting the Hugo Action"

sh -c "hugo $*"

echo "#################################################"
echo "Hugo build done"

echo "#################################################"
echo "Now publishing"
SOME_TOKEN=${GITHUB_TOKEN}

ls -ltar
cd public
ls -ltar

echo "Set user data."
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"

# Create CNAME file for redirect to this repository
if [[ "${CNAME}" ]]; then
  echo ${CNAME} > CNAME
fi

touch .nojekyll
ls -la
echo "Add all files."
git add -A
echo "Commit changes."
git commit -m 'Hugo build from Action'
git status
echo "Push."
git push
