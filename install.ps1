$ffmpeg = "ffmpeg-20191201.0.0-637742b"
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

Get-ChildItem * -Recurse -Include vcpkg_abi_info.txt, *.cmake, pkgconfig, libvpx, zlib, vpx, zconf.h, zlib.h | Remove-Item -Recurse -Verbose
Rename-Item `
  -Path "$rel32\installed\x86-windows-static-md-v142\debug\lib\vpxmdd.lib" `
  -NewName "vpxmd.lib"
Rename-Item `
  -Path "$rel64\installed\x64-windows-static-md-v142\debug\lib\vpxmdd.lib" `
  -NewName "vpxmd.lib"
Rename-Item `
  -Path "$rel32\installed\x86-windows-static-md-v142\debug\lib\zlibd.lib" `
  -NewName "zlib.lib"
Rename-Item `
  -Path "$rel64\installed\x64-windows-static-md-v142\debug\lib\zlibd.lib" `
  -NewName "zlib.lib"

