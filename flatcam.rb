class Flatcam < Formula
  include Language::Python::Virtualenv
  version "8.5.0"
  desc "FlatCAM: 2D Computer-Aided PCB Manufacturing"
  homepage "http://flatcam.org/"
  url "https://bitbucket.org/jpcgt/flatcam.git", :revision => "46454c293a9b390c931b52eb6217ca47e13b0231"
  depends_on "python" => "with-tcl-tk"
  depends_on "cartr/qt4/qt@4"
  depends_on "cartr/qt4/pyqt@4" => "with-python"
  depends_on "cartr/qt4/pyside@1.2" => "with-python"
  depends_on "geos"
  depends_on "spatialindex"
  #for matplotlib
  depends_on "pkg-config"
  depends_on "freetype"
  #for scipy(fortran compiler)
  depends_on "gcc"
  # pip tools "numpy","matplotlib" ,"rtree", "scipy", "shapely","simplejson" ,"svg.path"
  resource "Cycler" do
    url "https://files.pythonhosted.org/packages/c2/4b/137dea450d6e1e3d474e1d873cd1d4f7d3beed7e0dc973b06e8e10d32488/cycler-0.10.0.tar.gz"
    sha256 "cd7b2d1018258d7247a71425e9f26463dfb444d411c39569972f4ce586b0c9d8"
  end

  resource "kiwisolver" do
    url "https://files.pythonhosted.org/packages/31/60/494fcce70d60a598c32ee00e71542e52e27c978e5f8219fae0d4ac6e2864/kiwisolver-1.0.1.tar.gz"
    sha256 "ce3be5d520b4d2c3e5eeb4cd2ef62b9b9ab8ac6b6fedbaa0e39cdb6f50644278"
  end

  resource "matplotlib" do
    url "https://files.pythonhosted.org/packages/89/0c/653aec68e9cfb775c4fbae8f71011206e5e7fe4d60fcf01ea1a9d3bc957f/matplotlib-3.0.2.tar.gz"
    sha256 "c94b792af431f6adb6859eb218137acd9a35f4f7442cea57e4a59c54751c36af"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/2d/80/1809de155bad674b494248bcfca0e49eb4c5d8bee58f26fe7a0dd45029e2/numpy-1.15.4.zip"
    sha256 "3d734559db35aa3697dadcea492a423118c5c55d176da2f3be9c98d4803fc2a7"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/d0/09/3e6a5eeb6e04467b737d55f8bba15247ac0876f98fae659e58cd744430c6/pyparsing-2.3.0.tar.gz"
    sha256 "f353aab21fd474459d97b709e527b5571314ee5f067441dc9f88e33eecd96592"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/0e/01/68747933e8d12263d41ce08119620d9a7e5eb72c876a3442257f74490da0/python-dateutil-2.7.5.tar.gz"
    sha256 "88f9287c0174266bb0d8cedd395cfba9c58e87e5ad86b2ce58859bc11be3cf02"
  end

  resource "Rtree" do
    url "https://files.pythonhosted.org/packages/b0/6c/6cc8d738f14d5efa0c38ec29403bbd9c75e64b3fe84b53290178dda0dbd9/Rtree-0.8.3.tar.gz"
    sha256 "6cb9cf3000963ea6a3db777a597baee2bc55c4fc891e4f1967f262cc96148649"
  end

  resource "scipy" do
    url "https://files.pythonhosted.org/packages/07/76/7e844757b9f3bf5ab9f951ccd3e4a8eed91ab8720b0aac8c2adcc2fdae9f/scipy-1.1.0.tar.gz"
    sha256 "878352408424dffaa695ffedf2f9f92844e116686923ed9aa8626fc30d32cfd1"
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
    url "https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"
    sha256 "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
  end

  resource "svg.path" do
    url "https://files.pythonhosted.org/packages/5a/7f/7a601000fc400024f76e660569b0b97f98787279daff079f0dbfa89293ba/svg.path-3.0.tar.gz"
    sha256 "7b568f90f67fd25413c8da9f8bc9f9f8ab089425c20fa03330e97e77d13880ee"
  end

  def install
    venv = virtualenv_create(libexec,"python3")
    Pathname.glob(libexec/"lib/python*/site-packages").each do |sitepackage_path|
      sharepath = sitepackage_path.relative_path_from(libexec)/"share"
      inreplace "setup.py","py_modules=[",'py_modules=["ToolDblSided", "ToolMeasurement", "ToolTransform",'
      inreplace "setup.py", "share/flatcam", sharepath
    end
    venv.pip_install resources
    venv.pip_install_and_link buildpath
  end
  test do

    system "false"
  end
end
