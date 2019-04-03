# ffmpeg-msvc-nuget

A nuget package containing headers and libraries for FFmpeg, to make it easier to compile MSVC projects against the official ffmpeg libraries.

[![Build status](https://ci.appveyor.com/api/projects/status/hgm9v7c0jg4galvv?svg=true)](https://ci.appveyor.com/project/mcmtroffaes/ffmpeg-msvc-nuget)

## Requirements

* [Nuget](https://www.nuget.org/)

## Usage

A prebuilt nuget package can be found [here](https://www.nuget.org/packages/FFmpeg.Nightly.LGPL/). If you want to build your own nuget package, then:

  * Use ``install.ps1`` to download and extract the relevant FFmpeg dev and shared builds for both 32 bit and 64 bit.
  * Use ``nuget pack FFmpeg.Nightly.LGPL.nuspec`` to create the nuget package.

## License

All scripts for creating this nuget package are licensed under the
conditions of the [MIT license](LICENSE.txt). For the examples in the
[examples](examples) folder, see individual files for license details.

Note that the official FFmpeg windows build incorporates parts that
are covered by the LGPLv2.1 license. Consequently, if you use this nuget
package in your application, then you must comply with the terms of
the [LGPLv2.1 license](https://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html).

