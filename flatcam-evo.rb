class FlatcamEvo < Formula
    include Language::Python::Virtualenv
    desc "2D Computer-Aided PCB Manufacturing(Beta-evo)"
    homepage "https://bitbucket.org/marius_stanciu/flatcam_beta"
    url "https://bitbucket.org/marius_stanciu/flatcam_beta.git", branch: "Beta_8.995", revision: "a7c909273b4fcdf7b092eadf242f214b8011f69e"
    version "8.9.95"
    depends_on "pkg-config" => :build
    depends_on "freetype"
    depends_on "gdal"
    depends_on "geos"
    depends_on "pyqt"
    depends_on "python"
    depends_on "python-tk"
    depends_on "qpdf"
    depends_on "spatialindex"
  
    def install
      virtualenv_create(libexec, "python3", without_pip: false)
      inreplace "flatcam.py", "\nimport sys", "#!#{libexec}/bin/python3\nimport sys"
      system libexec/"bin/pip", "install", "-r", "requirements.txt"
      libexec.install Dir["*.py", "appCommon", "appEditors", "appGUI", \
        "appHandlers", "appObjects", "appParsers", "appPlugins", "assets", "config",\
        "descartes", "doc", "libs", "locale", "locale_template", \
        "preprocessors", "tclCommands", "Utils",]
      bin.install_symlink libexec/"flatcam.py" => "flatcam-evo"
      system "chmod", "+x", libexec/"flatcam.py"
      system "chmod", "+x", bin/"flatcam-evo"
    end
    test do
      system "true"
    end
  end
  

