class FlatcamBeta < Formula
  include Language::Python::Virtualenv
  desc "FlatCAM: 2D Computer-Aided PCB Manufacturing(Beta)"
  homepage "http://flatcam.org/"
  url "https://bitbucket.org/jpcgt/flatcam.git", branch: "Beta", revision: "a58cd5d9473554b9a620eb5eb44fb766f26ef693"
  version "8.9.9"
  depends_on "pkg-config" => :build
  depends_on "freetype"
  depends_on "gdal"
  depends_on "geos"
  depends_on "pyqt"
  depends_on "python"
  depends_on "spatialindex"

  def install
    virtualenv_create(libexec,"python3")
    inreplace "FlatCAM.py", "import sys", "#!#{libexec}/bin/python3\nimport sys"
    system libexec/"bin/pip", "install", "descartes" # missing dependency
    system libexec/"bin/pip", "install", "-r", "requirements.txt"
    libexec.install Dir["*.py", "appEditors", "appGUI", "appObjects", "appParsers", "appTools", "assets", "config",\
     "descrtes", "doc", "flatcamEditors", "flatcamGUI", "flatcamTools", "lib", "locale", "locale_template", \
     "postprocessors", "preprocessors", "py2", "tclCommands", "Utils"]
    bin.install_symlink libexec/"FlatCAM.py" => "flatcam"
    system "chmod", "+x", libexec/"FlatCAM.py" # ruby chmod method does not work for this line...
    system "chmod", "+x", bin/"flatcam"
  end
  test do
    system "false"
  end
end
