class FlatcamEvo < Formula
    include Language::Python::Virtualenv
    desc "2D Computer-Aided PCB Manufacturing(Beta-evo)"
    homepage "https://bitbucket.org/marius_stanciu/flatcam_beta"
    url "https://bitbucket.org/marius_stanciu/flatcam_beta.git", branch: "Beta_8.995", revision: "1ef01840d00eaad9dbd906832911ef63c0748625"
    version "8.9.95"
    depends_on "pkg-config" => :build
    depends_on "freetype"
    depends_on "gdal"
    depends_on "geos"
    depends_on "pyqt"
    depends_on "python@3.11"
    depends_on "python-tk@3.11"
    depends_on "qpdf"
    depends_on "spatialindex"
  
    def install
      venv = virtualenv_create(libexec, "python3.11", without_pip: false)
      inreplace "flatcam.py", "\nimport sys", "#!#{libexec}/bin/python3\nimport sys"
      inreplace "requirements.txt", "numpy>=1.16", "numpy>=1.16, <2.0" # fix numpy 2.x issue(#31)
      system libexec/"bin/pip", "install",
                    "--no-binary", "pillow",# fix link breakage of libpng(#27)
                    "-r", "requirements.txt"
      libexec.install Dir["*.py", "appCommon", "appEditors", "appGUI", \
        "appHandlers", "appObjects", "appParsers", "appPlugins", "assets", "config",\
        "descartes", "doc", "libs", "locale", "locale_template", \
        "preprocessors", "tclCommands", "Utils",]
      bin.install_symlink libexec/"flatcam.py" => "flatcam"
      system "chmod", "+x", libexec/"flatcam.py"
      system "chmod", "+x", bin/"flatcam"
    end
    test do
      system "true"
    end
  end
  

