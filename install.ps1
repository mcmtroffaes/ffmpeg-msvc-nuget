$ffmpeg = "ffmpeg-20190402-6aeaac3"
$dev32 = "$ffmpeg-win32-dev"
$dev64 = "$ffmpeg-win64-dev"
$shared32 = "$ffmpeg-win32-shared"
$shared64 = "$ffmpeg-win64-shared"
$wc = New-Object System.Net.WebClient

if (!(Test-Path "$dev32.zip")) { $wc.DownloadFile("http://ffmpeg.zeranoe.com/builds/win32/dev/$dev32.zip", "$env:temp/$dev32.zip") }
if (!(Test-Path "$dev64.zip")) { $wc.DownloadFile("http://ffmpeg.zeranoe.com/builds/win64/dev/$dev64.zip", "$env:temp/$dev64.zip") }
if (!(Test-Path "$shared32.zip")) { $wc.DownloadFile("http://ffmpeg.zeranoe.com/builds/win32/shared/$shared32.zip", "$env:temp/$shared32.zip") }
if (!(Test-Path "$shared64.zip")) { $wc.DownloadFile("http://ffmpeg.zeranoe.com/builds/win64/shared/$shared64.zip", "$env:temp/$shared64.zip") }

if (!(Test-Path $dev32)) { Expand-Archive "$env:temp/$dev32.zip" -DestinationPath . }
if (!(Test-Path $dev64)) { Expand-Archive "$env:temp/$dev64.zip" -DestinationPath . }
if (!(Test-Path $shared32)) { Expand-Archive "$env:temp/$shared32.zip" -DestinationPath . }
if (!(Test-Path $shared64)) { Expand-Archive "$env:temp/$shared64.zip" -DestinationPath . }

Copy-Item "$dev32\examples\*.c" examples

# unistd.h -> io.h (for MSVC)
$cfiles = Get-ChildItem -Path examples\ -Filter *.c
foreach ($file in $cfiles)
{
  (Get-Content $file.PSPath) |
  Foreach-Object { $_ -replace "unistd.h", "io.h" } |
    Set-Content $file.PSPath
}
