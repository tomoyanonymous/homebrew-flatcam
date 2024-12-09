# Homebrew-formula FlatCAM

This is an unofficial tap repository for homebrew [FlatCAM](http://flatcam.org/) to make installation on macOS easier.

## Installation

```sh
brew tap tomoyanonymous/flatcam

# Beta 8.995 w/ PyQt6(https://bitbucket.org/marius_stanciu/flatcam_beta/src/Beta_8.995/)
brew install flatcam-evo
# Beta 8.994 w/ PyQt5(https://bitbucket.org/jpcgt/flatcam/src/Beta)
brew install flatcam-beta
# classic w/ PyQt4 (No more recommended)
brew install flatcam
```

After the installation, simply you can run the app from a command `flatcam`[^flatcam-evo].

[^flatcam-evo]: Previously `flatcam-evo` created a link to `flatcam-evo` command but it now creates a command `flatcam` as same as others. 

Note: If you failed to launch after upgrade, remove `~/.FlatCAM` (temporary config directory).

Confirmed working on arm architectures.(OS Sequoia 15.5 / Macbook Air M1 2020).

## 3 versions of flatcam

Because flatcam is not strictly versioned, you can choose 3 different versions on this formula.

One is v 8.9.995, `flatcam-evo`, most frequently maintained version by Marius Stanciu, which uses PyQt6.

https://bitbucket.org/marius_stanciu/flatcam_beta/src/Beta_8.995/

Another is 8.9.94, `flatcam-beta` formula, which is on Beta branch on original repository mainly maintained by Stanciu, which uses PyQt5.

https://bitbucket.org/jpcgt/flatcam/src/Beta

The last one is v8.5.0, on master branch of an original repo. https://bitbucket.org/jpcgt/flatcam which was developed by Juan Pablo Caram and no longer maintained by him.This version uses PyQt4. However, old Qt is not provided through from homebrew-core. Thus the formula depends on unofficial tap `cartr/qt4`. *This formula is mostly kept on a historical purpose, not recommended to install anymore.* 

Also, note that flatcam package on pip is yet another unofficial version, which says the version is 0.8.5 but it uses pyqt5.

## Why this formula is unofficialy maintained for years?

Because that the formula does some unrecommended manner in an installation, this formula won't be merged to homebrew-core.

**Uses binary installation in pip install.** Homebrew usually recommends to build a binary from source including python packages. However, `ortools`, one of dependencies does not provide a way to install it other than using wheel (built package for python). Thus, in the formula uses normal `pip install -r requirements.txt`. Also, `requirements.txt` seems to be missing `descartes` package so the formula will additinally install it.

**Symlinks for main file** In v8.5.0, the main executable file was `flatcam` but in Beta branch, it's `FlatCAM.py`. To use it from CLI directly, the formula prepends shebang `#!/usr/local/Cellar/flatcam-beta/8.9.94/libexec/python` and create symlink to the file in `/usr/local/Cellar/flatcam-beta/8.9.94/bin/flatcam`.


## Author

Matsuura Tomoya

<https://matsuuratomoya.com>

## License

MIT
