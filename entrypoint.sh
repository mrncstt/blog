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
