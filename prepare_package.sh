#!/bin/sh

# Check for arguments
if [ $# -eq 0 ]; then
    echo "No arguments provided. First argument has to be version, e.g. '1.8.1'"
    exit 1
fi
NEW_VERSION=$1
FRAMEWORK_NAME=$2

echo "git commit all without framework and push"
git add "GizoSDK/$NEW_VERSION/"
git commit -m "New $FRAMEWORK_NAME version $NEW_VERSION"
# git tag -a $NEW_VERSION -m "Version $NEW_VERSION"
git push

echo "Releasing the new version"
gh release create "$NEW_VERSION"