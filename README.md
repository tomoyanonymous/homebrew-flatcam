# Homebrew-formula Flatcam

This is an unofficial tap repository for homebrew [FlatCAM](http://flatcam.org/).

## Installation

```sh

brew tap tomoyanonymous/flatcam

brew install flatcam
# or
brew install flatcam-beta

```

After the installation, simply you can run the app from a command `flatcam`.

Note: If you failed to launch after upgrade, remove `~/.FlatCAM` (temporary config directory).

## 2 versions of flatcam

You can install 2 different versions of flatcam.

One is v8.5.0, on master branch of an [official tree](https://bitbucket.org/jpcgt/flatcam) which is originally developed by Juan Pablo Caram and no longer maintained.
This version depends on Qt4 because it uses pyqt4. However, old Qt is not provided through from homebrew-core. Thus the formula uses `cartr/qt4`.
It also depends on gcc to install a fortran compiler required from scipy. An installation of gcc takes over an hour to build.

Another is 8.9.x, `flatcam-beta` formula, which is on Beta branch on bitbucket actively maintained by Marius Stanciu.

This version uses PyQt5 and other updated libraries.
Note that the formula for beta version does some unrecommended manner in an installation.

**Uses binary installation in pip install.** Homebrew usually recommends to build a binary from source including python packages. However, `ortools`, one of dependencies does not provide a way to install it other than using wheel (built package for python). Thus, in the formula uses normal `pip install -r requirements.txt`. Also, `requirements.txt` seems to be missing `descartes` package so the formula will additinally install it.

**Symlinks for main file** In v8.5.0, the main executable file was `flatcam` but in Beta branch, it's `FlatCAM.py`. To use it from CLI directly, the formula prepends shebang `#!/usr/local/Cellar/flatcam-beta/8.9.9/libexec/python` and create symlink to the file in `/usr/local/Cellar/flatcam-beta/8.9.9/bin/flatcam`.

Also, note that flatcam package on pip is yet another unofficial version, which says the version is 0.8.5 but it uses pyqt5.

## Author

Matsuura Tomoya

<https://matsuuratomoya.com>

## License

MIT
