class Flatcam < Formula
  include Language::Python::Virtualenv
  desc "2D Computer-Aided PCB Manufacturing"
  homepage "http://flatcam.org/"
  url "https://bitbucket.org/jpcgt/flatcam.git", revision: "46454c293a9b390c931b52eb6217ca47e13b0231"
  version "8.5.0"
  depends_on "cartr/qt4/pyqt@4"
  depends_on "cartr/qt4/pyside@1.2"
  depends_on "cartr/qt4/qt@4"
  depends_on "freetype"
  depends_on "gcc"
  depends_on "geos"
  depends_on "pkg-config"
  depends_on "python"
  depends_on "spatialindex"
  # pip tools "numpy","matplotlib" ,"rtree", "scipy", "shapely","simplejson" ,"svg.path"
  resource "Cycler" do
    url "https://files.pythonhosted.org/packages/c2/4b/137dea450d6e1e3d474e1d873cd1d4f7d3beed7e0dc973b06e8e10d32488/cycler-0.10.0.tar.gz"
    sha256 "cd7b2d1018258d7247a71425e9f26463dfb444d411c39569972f4ce586b0c9d8"
  end

  resource "kiwisolver" do
    url "https://files.pythonhosted.org/packages/16/e7/df58eb8868d183223692d2a62529a594f6414964a3ae93548467b146a24d/kiwisolver-1.1.0.tar.gz"
    sha256 "53eaed412477c836e1b9522c19858a8557d6e595077830146182225613b11a75"
  end

  resource "matplotlib" do
    url "https://files.pythonhosted.org/packages/51/fe/84ab101f8ab543d89b6a128326f62adcdafd2781ab8362a737e6ce78eea7/matplotlib-3.1.0.tar.gz"
    sha256 "1e0213f87cc0076f7b0c4c251d7e23601e2419cd98691df79edb95517ba06f0c"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/d3/4b/f9f4b96c0b1ba43d28a5bdc4b64f0b9d3fbcf31313a51bc766942866a7c7/numpy-1.16.4.zip"
    sha256 "7242be12a58fec245ee9734e625964b97cf7e3f2f7d016603f9e56660ce479c7"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/5d/3a/24d275393f493004aeb15a1beae2b4a3043526e8b692b65b4a9341450ebe/pyparsing-2.4.0.tar.gz"
    sha256 "1873c03321fc118f4e9746baf201ff990ceb915f433f23b395f5580d1840cb2a"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/ad/99/5b2e99737edeb28c71bcbec5b5dda19d0d9ef3ca3e92e3e925e7c0bb364c/python-dateutil-2.8.0.tar.gz"
    sha256 "c89805f6f4d64db21ed966fda138f8a5ed7a4fdbc1a8ee329ce1b74e3c74da9e"
  end

  resource "Rtree" do
    url "https://files.pythonhosted.org/packages/b0/6c/6cc8d738f14d5efa0c38ec29403bbd9c75e64b3fe84b53290178dda0dbd9/Rtree-0.8.3.tar.gz"
    sha256 "6cb9cf3000963ea6a3db777a597baee2bc55c4fc891e4f1967f262cc96148649"
  end

  resource "scipy" do
    url "https://files.pythonhosted.org/packages/cb/97/361c8c6ceb3eb765371a702ea873ff2fe112fa40073e7d2b8199db8eb56e/scipy-1.3.0.tar.gz"
    sha256 "c3bb4bd2aca82fb498247deeac12265921fe231502a6bc6edea3ee7fe6c40a7a"
  end

  resource "Shapely" do
    url "https://files.pythonhosted.org/packages/a2/fb/7a7af9ef7a35d16fa23b127abee272cfc483ca89029b73e92e93cdf36e6b/Shapely-1.6.4.post2.tar.gz"
    sha256 "c4b87bb61fc3de59fc1f85e71a79b0c709dc68364d9584473697aad4aa13240f"
  end

  resource "simplejson" do
    url "https://files.pythonhosted.org/packages/e3/24/c35fb1c1c315fc0fffe61ea00d3f88e85469004713dab488dee4f35b0aff/simplejson-3.16.0.tar.gz"
    sha256 "b1f329139ba647a9548aa05fb95d046b4a677643070dc2afc05fa2e975d09ca5"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/dd/bf/4138e7bfb757de47d1f4b6994648ec67a51efe58fa907c1e11e350cddfca/six-1.12.0.tar.gz"
    sha256 "d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73"
  end

  resource "svg.path" do
    url "https://files.pythonhosted.org/packages/5a/7f/7a601000fc400024f76e660569b0b97f98787279daff079f0dbfa89293ba/svg.path-3.0.tar.gz"
    sha256 "7b568f90f67fd25413c8da9f8bc9f9f8ab089425c20fa03330e97e77d13880ee"
  end

  def install
    venv = virtualenv_create(libexec, "python3")
    Pathname.glob(libexec/"lib/python*/site-packages").each do |sitepackage_path|
      sharepath = sitepackage_path.relative_path_from(libexec)/"share"
      inreplace "setup.py", "py_modules=[", 'py_modules=["ToolDblSided", "ToolMeasurement", "ToolTransform",'
      inreplace "setup.py", "share/flatcam", sharepath
    end
    venv.pip_install resources
    venv.pip_install_and_link buildpath
  end
  test do
    system "true"
  end
end
