#!/bin/bash

OLD_VERSION=`sed -n 's|[$]ffmpeg = "ffmpeg-\(.*\)"|\1|p' install.ps1`
NEW_VERSION=`curl https://ffmpeg.zeranoe.com/builds/ | grep -Po 'value="\K[0-9]+-[a-z0-9]+' | head -n 1`

if [ "$OLD_VERSION" == "$NEW_VERSION" ] && [ "$1" != "--force" ]
then
  echo "Already up to date."
  exit 0
fi

OLD_NUGET_VERSION=`sed -n 's|\s*<version>\(.*\)</version>|\1|p' FFmpeg.Nightly.nuspec`
OLD_NUGET_VERSION_MAJOR=`expr "${OLD_NUGET_VERSION}" : '^\([0-9]*\)[.]'`
OLD_NUGET_VERSION_MINOR=`expr "${OLD_NUGET_VERSION}" : '^[0-9]*[.]\([0-9]*\)'`
NEW_NUGET_VERSION_MAJOR=${NEW_VERSION:0:8}

if [ "$OLD_NUGET_VERSION_MAJOR" \> "$NEW_NUGET_VERSION_MAJOR" ]
then
    echo "New major version is lower than old version."
    exit 1
fi

if [ "$OLD_NUGET_VERSION_MAJOR" == "$NEW_NUGET_VERSION_MAJOR" ]
then
    NEW_NUGET_VERSION_MINOR=$((OLD_NUGET_VERSION_MINOR+1))
else
    NEW_NUGET_VERSION_MINOR=0
fi

NEW_NUGET_VERSION=${NEW_NUGET_VERSION_MAJOR}.${NEW_NUGET_VERSION_MINOR}.0

OLD_GIT_VERSION=`expr "${OLD_VERSION}" : '^[0-9]*-\(.*\)'`
NEW_GIT_VERSION=`expr "${NEW_VERSION}" : '^[0-9]*-\(.*\)'`

echo "$OLD_VERSION -> $NEW_VERSION"
echo "$OLD_NUGET_VERSION -> $NEW_NUGET_VERSION"
echo "$OLD_GIT_VERSION -> $NEW_GIT_VERSION"

find . -type f -exec sed -i "s/$OLD_VERSION/$NEW_VERSION/g" {} \;
find . -type f -exec sed -i "s/$OLD_NUGET_VERSION/$NEW_NUGET_VERSION/g" {} \;
sed -i "s/$OLD_GIT_VERSION/$NEW_GIT_VERSION/g" FFmpeg.Nightly.nuspec
sed -i "s/$OLD_GIT_VERSION/$NEW_GIT_VERSION/g" nuget-readme.txt

git commit -a -m "Update ffmpeg version to $NEW_VERSION."
git tag -a -m "Tagging version $NEW_NUGET_VERSION." $NEW_NUGET_VERSION
