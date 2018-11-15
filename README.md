# Homebrew-formula Flatcam

This is the tap repository for homebrew [FlatCAM](http://flatcam.org/).

## Installation

```sh

brew tap tomoyanonymous/flatcam

brew install flatcam

```

## Current Problem(11/15/2018)

In some environment, builds of scipy and matplotlib fail, maybe because invalid c++ headers are loaded.
As a temporary solution, you can install with `brew install --debug flatcam` and by choosing 2(ignore) when the error occurs.
After that, running `/usr/local/Cellar/flatcam/8.5.0/libexec/bin/pip install numpy matplotlib` installs binary without building.

It's also helpful to report your environment regardless the error happened or successfully built.

## Caution

This version is 8.5.0, on master branch of an [official tree](https://bitbucket.org/jpcgt/flatcam).
flatcam on pip is different from this, unofficial branch that uses pyqt5.

It depends on Qt4 from `cartr/qt4`, not homebrew-core taps.

It also depends on gcc to install a fortran compiler required from scipy. An installation of gcc takes over an hour to build.

## Author

Matsuura Tomoya

<https://matsuuratomoya.com>

## License

MIT
