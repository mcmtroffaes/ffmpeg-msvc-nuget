This nuget package contains headers and libraries for FFmpeg for use
with Visual Studio.

FFmpeg is a pure C project, so to use the libraries within your C++
application you must encompass your FFmpeg includes using extern "C".
Otherwise, you will experience link errors. For more details, see
https://ffmpeg.org/faq.html

Note that this build incorporates parts that are covered by the
LGPLv2.1 license. Consequently, if you use this nuget package in your
application, then you must comply with the terms of the LGPLv2.1
license.

In the build\native\share\doc folder of this nuget package, you can
find a copy of the LGPLv2.1 license which applies to this build
(license.txt).

For more information on FFmpeg's license, see:

* https://git.ffmpeg.org/gitweb/ffmpeg.git/blob/d73f062:/LICENSE.md

* https://ffmpeg.org/legal.html
