$ffmpeg = "ffmpeg-20190327.0.1-681957b8"
$version = ($ffmpeg -split '-')[1]
$static32 = "$ffmpeg-lgpl21-v141-static-md-release-x86"
$static64 = "$ffmpeg-lgpl21-v141-static-md-release-x64"
$wc = New-Object System.Net.WebClient

if (!(Test-Path "$static64.zip")) { $wc.DownloadFile("https://github.com/mcmtroffaes/ffmpeg-msvc-build/releases/download/$version/$static64.zip", "$env:temp/$static64.zip") }

if (!(Test-Path $static64)) { Expand-Archive "$env:temp/$static64.zip" -DestinationPath . }
