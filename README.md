# Homebrew-formula Flatcam

This is the tap repository for homebrew [FlatCAM](http://flatcam.org/).

## Installation

```sh

brew tap tomoyanonymous/flatcam

brew install flatcam

```

After the installation, simply you can run the app from a command `flatcam`

## Current Problem(06/01/2019)

In some environment, installation of PySide 1.2 will fail.
As a temporary solution, you can install with
`brew install --debug flatcam`
and when the error occurs, it will ask you to choose an action and choose 2 to ignore it(There are no effects ).

```sh
1. raise
2. ignore
3. backtrace
4. irb
5. shell
Choose an action: 2
```


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
