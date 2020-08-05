#!/usr/bin/env bash

# Get version argument and verify
target=${1:-target}
version=${2:-$(git symbolic-ref --short -q HEAD)}

# Output
echo "-------------------------------------------------------------------------"
echo "Releasing version $version"
echo "-------------------------------------------------------------------------"

git push

# Get current branch and checkout if needed
branch=$(git symbolic-ref --short -q HEAD)
if [ "$branch" != "$version" ]; then
  git checkout $version  
fi

# Ensure working directory in version branch clean
git update-index -q --refresh
if ! git diff-index --quiet HEAD --; then
  echo "-------------------------------------------------------------------------"
  echo "Working directory not clean, please commit your changes first"
  echo "-------------------------------------------------------------------------"
  exit
fi

# Checkout dev branch and merge master into dev (to ensure we have the version)
git fetch --all
git branch -D $target
git checkout $target
git pull 
git merge $version --no-ff --no-edit

git push
git push --tags

# Switch to old branch
git checkout $version

# Success
echo "-------------------------------------------------------------------------"
echo "Merge $version to $target complete"
echo "-------------------------------------------------------------------------"
