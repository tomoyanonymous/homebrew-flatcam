class FlatcamBeta < Formula
  include Language::Python::Virtualenv
  desc "2D Computer-Aided PCB Manufacturing(Beta)"
  homepage "http://flatcam.org/"
  url "https://bitbucket.org/jpcgt/flatcam.git", branch: "Beta", revision: "f04d8be50fb57a489f7f7aa714ecf78d0dd266a6"
  version "8.9.94"
  depends_on "pkg-config" => :build
  depends_on "freetype"
  depends_on "gdal"
  depends_on "geos"
  depends_on "pyqt@5"
  depends_on "python"
  depends_on "python-tk"
  depends_on "spatialindex"

  def install
    virtualenv_create(libexec, "python3", without_pip: false)
    inreplace "FlatCAM.py", "import sys", "#!#{libexec}/bin/python3\nimport sys"
    inreplace "requirements.txt", "vispy", "vispy==0.7.1" # patch for fixing vispy version
    inreplace "requirements.txt", "shapely>=1.7.0", "shapely==1.8.5"
    system libexec/"bin/pip", "install", "descartes" # missing dependency
    system libexec/"bin/pip", "install", "-r", "requirements.txt"
    libexec.install Dir["*.py", "appCommon", "appEditors", "appGUI", "appObjects", "appParsers", "appTools", "assets", "config",\
     "descrtes", "doc", "flatcamEditors", "flatcamGUI", "flatcamTools", "lib", "locale", "locale_template", \
     "postprocessors", "preprocessors", "py2", "tclCommands", "Utils"]
    bin.install_symlink libexec/"FlatCAM.py" => "flatcam"
    system "chmod", "+x", libexec/"FlatCAM.py" # ruby chmod method does not work for this line...
    system "chmod", "+x", bin/"flatcam"
  end
  test do
    system "true"
  end
end
