# Homebrew-formula FlatCAM

This is an unofficial tap repository for homebrew [FlatCAM](http://flatcam.org/) to make installation on macOS easier.

## Installation

```sh
brew tap tomoyanonymous/flatcam

brew install flatcam
# or beta 8.994
brew install flatcam-beta
# or beta 8.995
brew install flatcam-evo

```

After the installation, simply you can run the app from a command `flatcam`.
Note: If you failed to launch after upgrade, remove `~/.FlatCAM` (temporary config directory).

Currently working on both of intel and arm architectures.(OS Ventura 13.4, Macbook Pro 16inch 2019 / Macbook Air M1 2020).

## 3 versions of flatcam

You can choose 3 different versions of flatcam.

One is v8.5.0, on master branch of an [official tree](https://bitbucket.org/jpcgt/flatcam) which is originally developed by Juan Pablo Caram and no longer maintained.
This version depends on Qt4 because it uses pyqt4. However, old Qt is not provided through from homebrew-core. Thus the formula uses `cartr/qt4`.
It also depends on gcc to install a fortran compiler required from scipy. An installation of gcc takes over an hour to build.

Another is 8.9.94, `flatcam-beta` formula, which is on Beta branch on bitbucket actively maintained by Marius Stanciu.

This version uses PyQt5 and other updated libraries.
Note that the formula for beta version does some unrecommended manner in an installation.

**Uses binary installation in pip install.** Homebrew usually recommends to build a binary from source including python packages. However, `ortools`, one of dependencies does not provide a way to install it other than using wheel (built package for python). Thus, in the formula uses normal `pip install -r requirements.txt`. Also, `requirements.txt` seems to be missing `descartes` package so the formula will additinally install it.

**Symlinks for main file** In v8.5.0, the main executable file was `flatcam` but in Beta branch, it's `FlatCAM.py`. To use it from CLI directly, the formula prepends shebang `#!/usr/local/Cellar/flatcam-beta/8.9.94/libexec/python` and create symlink to the file in `/usr/local/Cellar/flatcam-beta/8.9.94/bin/flatcam`.

Also, note that flatcam package on pip is yet another unofficial version, which says the version is 0.8.5 but it uses pyqt5.

### flatcam-evo (added on 2023-06-22)

You can install more updated version 8.995 on the different repo by Marius Stanciu, which uses PyQt6 with `brew install flatcam-evo`.

This formula create `flatcam-evo` command, not `flatcam`.

https://bitbucket.org/marius_stanciu/flatcam_beta/src/Beta_8.995/ 


## Author

Matsuura Tomoya

<https://matsuuratomoya.com>

## License

MIT
