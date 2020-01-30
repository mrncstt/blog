#!/bin/bash
set -e

git submodule init
git submodule update

git submodule add https://github.com/mrncstt/mrncstt.github.io.git public

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
git log -2
git remote -v

echo "Set user data."
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"

# Create CNAME file for redirect to this repository
if [[ "${CNAME}" ]]; then
  echo ${CNAME} > CNAME
fi

touch .nojekyll
pwd
ls -ltar
ls -la
echo "Add all files."
git add -A -v
git status
echo "Commit changes."
git commit -m 'Hugo build from Action'
git status
echo "Push."
git push

echo "#################################################"
echo "Published"
