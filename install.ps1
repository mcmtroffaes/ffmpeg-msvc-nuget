$ffmpeg = "ffmpeg-20191118.0.0-d831edc"
$version = ($ffmpeg -split '-')[1]
$rel32 = "$ffmpeg-lgpl21-v142-static-md-x86"
$rel64 = "$ffmpeg-lgpl21-v142-static-md-x64"
$wc = New-Object System.Net.WebClient

if (!(Test-Path "$rel32.7z")) {
  Write-Output "Downloading https://github.com/mcmtroffaes/ffmpeg-msvc-build/releases/download/$version/$rel32.7z ..."
  $wc.DownloadFile("https://github.com/mcmtroffaes/ffmpeg-msvc-build/releases/download/$version/$rel32.7z", "$env:temp/$rel32.7z")
}
if (!(Test-Path "$rel64.7z")) {
  Write-Output "Downloading https://github.com/mcmtroffaes/ffmpeg-msvc-build/releases/download/$version/$rel64.7z ..."
  $wc.DownloadFile("https://github.com/mcmtroffaes/ffmpeg-msvc-build/releases/download/$version/$rel64.7z", "$env:temp/$rel64.7z")
}

if (!(Test-Path $rel32)) { 7z x "$env:temp/$rel32.7z" }
if (!(Test-Path $rel64)) { 7z x "$env:temp/$rel64.7z" }

Get-ChildItem * -Recurse -Include vcpkg_abi_info.txt, *.cmake, vpx*.lib, vpx*.pdb, zlib*.lib, pkgconfig, libvpx, zlib, vpx, zconf.h, zlib.h | Remove-Item -Recurse -Verbose
