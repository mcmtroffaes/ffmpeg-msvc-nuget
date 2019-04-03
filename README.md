# ffmpeg-nuget

A nuget package containing headers, import libraries, and runtime dlls for FFmpeg based on the [official builds](https://ffmpeg.zeranoe.com/builds/), to make it easier to compile MSVC projects against the official ffmpeg libraries.

[![Build status](https://ci.appveyor.com/api/projects/status/vcsn0fpr5s1j6p2y/branch/master?svg=true)](https://ci.appveyor.com/project/mcmtroffaes/ffmpeg-nuget/branch/master)

## Requirements

* [Nuget](https://www.nuget.org/)

## Usage

A prebuilt nuget package can be found [here](https://www.nuget.org/packages/FFmpeg.Nightly/). If you want to build your own nuget package, then:

  * Use ``install.ps1`` to download and extract the relevant FFmpeg dev and shared builds for both 32 bit and 64 bit.
  * Use ``build.ps1`` to regenerate the lib files using Visual Studio 14.0 tools.
  * Use ``nuget pack FFmpeg.Nightly.nuspec`` to create the nuget package.

## License

All scripts for creating this nuget package are licensed under the
conditions of the [MIT license](LICENSE.txt). For the examples in the
[examples](examples) folder, see individual files for license details.

Note that the official FFmpeg windows build incorporates parts that
are covered by the GPLv3 license. Consequently, if you use this nuget
package in your application, then you must comply with the terms of
the [GPLv3 license](https://www.gnu.org/licenses/gpl-3.0.en.html).

