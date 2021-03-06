#!/bin/bash

OLD_VERSION=`sed -n 's|[$]ffmpeg = "ffmpeg-\(.*\)"|\1|p' install.ps1`
NEW_VERSION=`curl -L https://github.com/mcmtroffaes/ffmpeg-msvc-build/releases/latest | grep -Po '<a href="/mcmtroffaes/ffmpeg-msvc-build/releases/download/[0-9.]+/ffmpeg-\K[0-9.]+-[a-z0-9]+' | head -n 1`

if [ "$OLD_VERSION" == "$NEW_VERSION" ] && [ "$1" != "--force" ]
then
  echo "Already up to date."
  exit 0
fi

if [ "$NEW_VERSION" == "" ]
then
  echo "Failed to get latest version from website."
  exit 1
fi

OLD_NUGET_VERSION=`sed -n 's|\s*<version>\(.*\)</version>|\1|p' FFmpeg.Nightly.LGPL.nuspec`
NEW_NUGET_VERSION=`expr "${NEW_VERSION}" : '^\([0-9]*[.][0-9]*[.][0-9]*\)'`

OLD_GIT_VERSION=`expr "${OLD_VERSION}" : '^[0-9.]*-\(.*\)'`
NEW_GIT_VERSION=`expr "${NEW_VERSION}" : '^[0-9.]*-\(.*\)'`

echo "$OLD_VERSION -> $NEW_VERSION"
echo "$OLD_NUGET_VERSION -> $NEW_NUGET_VERSION"
echo "$OLD_GIT_VERSION -> $NEW_GIT_VERSION"

find *.nuspec *.ps1 test/ -type f -exec sed -i "s/$OLD_VERSION/$NEW_VERSION/g" {} \;
find *.nuspec *.ps1 test/ -type f -exec sed -i "s/$OLD_NUGET_VERSION/$NEW_NUGET_VERSION/g" {} \;
sed -i "s/$OLD_GIT_VERSION/$NEW_GIT_VERSION/g" FFmpeg.Nightly.LGPL.nuspec
sed -i "s/$OLD_GIT_VERSION/$NEW_GIT_VERSION/g" nuget-readme.txt

git commit -a -m "Update ffmpeg version to $NEW_VERSION."
git tag -a -m "Tagging version $NEW_NUGET_VERSION." $NEW_NUGET_VERSION
