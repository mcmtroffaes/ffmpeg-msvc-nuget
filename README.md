# ffmpeg-msvc-nuget

A nuget package containing headers and static libraries for an LGPL build of FFmpeg, to make it easier to compile MSVC projects that use FFmpeg. The scripts for building FFmpeg itself are maintained separately at the [ffmpeg-msvc-build](https://github.com/mcmtroffaes/ffmpeg-msvc-build) project.

[![Build status](https://ci.appveyor.com/api/projects/status/hgm9v7c0jg4galvv?svg=true)](https://ci.appveyor.com/project/mcmtroffaes/ffmpeg-msvc-nuget)

**I am planning to retire this repository from October 1st 2020 onward, since Visual Studio has nowadays excellent integration with vcpkg. Please use [ffmpeg-msvc-build](https://github.com/mcmtroffaes/ffmpeg-msvc-build) directly, or simply build ffmpeg yourself using vcpkg. If you are interested in maintaining the nuget package, please get in touch.**

## Requirements

* [Nuget](https://www.nuget.org/)

## Usage

A prebuilt nuget package can be found [here](https://www.nuget.org/packages/FFmpeg.Nightly.LGPL/). If you want to build your own nuget package, then:

  * Use ``install.ps1`` to download and extract the relevant FFmpeg builds.
  * Use ``nuget pack FFmpeg.Nightly.LGPL.nuspec`` to create the nuget package.

## License

All scripts for creating this nuget package are licensed under the
conditions of the [MIT license](LICENSE.txt). For the examples in the
[examples](examples) folder, see individual files for license details.

Note that the official FFmpeg windows build incorporates parts that
are covered by the LGPLv2.1 license. Consequently, if you use this nuget
package in your application, then you must comply with the terms of
the [LGPLv2.1 license](https://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html).

