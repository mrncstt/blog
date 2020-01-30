#!/bin/bash
set -e

git submodule update --init --remote themes/hyde-hyde
cd themes
ls -ltar
cd hyde-hyde
ls -ltar
cd ../..
ls -ltar

echo "#################################################"
echo "Starting the Hugo Action"

sh -c "hugo $*"

hugo -D
echo "#################################################"
echo "Hugo build done"

cd public

echo "#################################################"
echo "Now publishing"
SOME_TOKEN=${GITHUB_TOKEN}

echo "Current repository is ${GITHUB_REPOSITORY}"
remote_branch="master"

echo "Determined branch ${remote_branch}"

if [ "${GITHUB_REF}" == "refs/heads/${remote_branch}" ]; then
  echo "Cannot publish on branch ${remote_branch}"
  exit 1
else
  echo "Pushing on branch ${remote_branch}"
fi

USER_NAME="$(echo ${GITHUB_REPOSITORY} | cut -d'/' -f1)"
echo "Username: ${USER_NAME}"
REPO_NAME="$(echo ${GITHUB_REPOSITORY} | cut -d'/' -f2)"
echo "Repository name: ${REPO_NAME}"

# GitHub Pages does not recognize changes, if they are force pushed!
echo "Set user data."
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"

local_directory="../${REPO_NAME}"
remote_repo="https://${SOME_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
ls -la
git pull -v
echo "Check credentials."
git pull -v origin master
git checkout $remote_branch
echo "Move .git to build"
mv .git build/.git
#find . \( ! -name './.git' -a ! -name './.git/**/*' -a ! -name '\.' \) -delete -print
cd build

rm -f .gitignore
rm -f Dockerfile
rm -f entrypoint.sh

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
git push ${remote_repo}
cd ..
echo "Remove everything."
rm -rf ./public
