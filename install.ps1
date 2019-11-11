$ffmpeg = "ffmpeg-20191110.0.0-3a84081"
$version = ($ffmpeg -split '-')[1]
$deb32 = "$ffmpeg-lgpl21-v141-static-md-debug-x86"
$deb64 = "$ffmpeg-lgpl21-v141-static-md-debug-x64"
$rel32 = "$ffmpeg-lgpl21-v141-static-md-release-x86"
$rel64 = "$ffmpeg-lgpl21-v141-static-md-release-x64"
$wc = New-Object System.Net.WebClient

if (!(Test-Path "$deb32.zip")) { $wc.DownloadFile("https://github.com/mcmtroffaes/ffmpeg-msvc-build/releases/download/$version/$deb32.zip", "$env:temp/$deb32.zip") }
if (!(Test-Path "$deb64.zip")) { $wc.DownloadFile("https://github.com/mcmtroffaes/ffmpeg-msvc-build/releases/download/$version/$deb64.zip", "$env:temp/$deb64.zip") }
if (!(Test-Path "$rel32.zip")) { $wc.DownloadFile("https://github.com/mcmtroffaes/ffmpeg-msvc-build/releases/download/$version/$rel32.zip", "$env:temp/$rel32.zip") }
if (!(Test-Path "$rel64.zip")) { $wc.DownloadFile("https://github.com/mcmtroffaes/ffmpeg-msvc-build/releases/download/$version/$rel64.zip", "$env:temp/$rel64.zip") }

if (!(Test-Path $deb32)) { Expand-Archive "$env:temp/$deb32.zip" -DestinationPath . }
if (!(Test-Path $deb64)) { Expand-Archive "$env:temp/$deb64.zip" -DestinationPath . }
if (!(Test-Path $rel32)) { Expand-Archive "$env:temp/$rel32.zip" -DestinationPath . }
if (!(Test-Path $rel64)) { Expand-Archive "$env:temp/$rel64.zip" -DestinationPath . }
