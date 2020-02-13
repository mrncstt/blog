#!/bin/bash
set -e

git submodule init
git submodule update

git submodule add https://${GITHUB_TOKEN}@github.com/mrncstt/mrncstt.github.io.git public

echo "#################################################"
echo "Starting the Hugo Action"

sh -c "hugo $*"

echo "#################################################"
echo "Hugo build done"

echo "#################################################"
echo "Now publishing"
SOME_TOKEN=${GITHUB_TOKEN}

USER_NAME="${GITHUB_ACTOR}"
MAIL="${GITHUB_ACTOR}@users.noreply.github.com"

ls -ltar
cd public
ls -ltar
git log -2
git remote -v

echo "Set user data."
git config user.name "${USER_NAME}"
git config user.email "${MAIL}"

# Create CNAME file for redirect to this repository
if [[ "${CNAME}" ]]; then
  echo ${CNAME} > CNAME
fi

touch .nojekyll
echo "Add all files."
git add -A -v
git status
git diff-index --quiet HEAD || echo "Commit changes." && git commit -m 'Hugo build from Action' && echo "Push." && git push origin

echo "#################################################"
echo "Published"
