#!/bin/bash
set -e

git submodule update --init --remote themes/hyde-hyde

echo "#################################################"
echo "Starting the Hugo Action"

sh -c "hugo $*"

echo "#################################################"
echo "Hugo build done"

echo "#################################################"
echo "Now publishing"
SOME_TOKEN=${GITHUB_TOKEN}

ls -ltar
git submodule update --init --remote public
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
