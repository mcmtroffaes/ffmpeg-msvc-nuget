$ffmpeg = "ffmpeg-20191117.0.0-b741a84"
$version = ($ffmpeg -split '-')[1]
$rel32 = "$ffmpeg-lgpl21-v142-static-md-release-x86"
$rel64 = "$ffmpeg-lgpl21-v142-static-md-release-x64"
$wc = New-Object System.Net.WebClient

if (!(Test-Path "$rel32.zip")) { $wc.DownloadFile("https://github.com/mcmtroffaes/ffmpeg-msvc-build/releases/download/$version/$rel32.zip", "$env:temp/$rel32.zip") }
if (!(Test-Path "$rel64.zip")) { $wc.DownloadFile("https://github.com/mcmtroffaes/ffmpeg-msvc-build/releases/download/$version/$rel64.zip", "$env:temp/$rel64.zip") }

if (!(Test-Path $rel32)) { & 7z x "$env:temp/$rel32.zip" }
if (!(Test-Path $rel64)) { & 7z x "$env:temp/$rel64.zip" }
