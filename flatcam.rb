
class Flatcam < Formula
  include Language::Python::Virtualenv
  version "8.5.0"
  desc "FlatCAM: 2D Computer-Aided PCB Manufacturing"
  homepage "http://flatcam.org/"
  url "https://bitbucket.org/jpcgt/flatcam.git"
  depends_on "python" => "with-tcl-tk"
  depends_on "cartr/qt4/qt@4"
  depends_on "cartr/qt4/pyqt@4"
  depends_on "cartr/qt4/pyside@1.2"
  depends_on "geos"
  depends_on "spatialindex"
  #for matplotlib
  depends_on "pkg-config"
  depends_on "freetype"
  #for scipy(fortran compiler)
  depends_on "gcc"
  # pip tools "numpy","matplotlib" ,"rtree", "scipy", "shapely","simplejson" ,"svg.path"
  resource "backports.functools_lru_cache" do
    url "https://files.pythonhosted.org/packages/57/d4/156eb5fbb08d2e85ab0a632e2bebdad355798dece07d4752f66a8d02d1ea/backports.functools_lru_cache-1.5.tar.gz"
    sha256 "9d98697f088eb1b0fa451391f91afb5e3ebde16bbdb272819fd091151fda4f1a"
  end

  resource "Cycler" do
    url "https://files.pythonhosted.org/packages/c2/4b/137dea450d6e1e3d474e1d873cd1d4f7d3beed7e0dc973b06e8e10d32488/cycler-0.10.0.tar.gz"
    sha256 "cd7b2d1018258d7247a71425e9f26463dfb444d411c39569972f4ce586b0c9d8"
  end

  resource "matplotlib" do
    url "https://files.pythonhosted.org/packages/62/81/e394906a8a15c46b56110c558c222d4d9b3735f0595e254918eca47f98cf/matplotlib-3.0.1.tar.gz"
    sha256 "70f8782c50ac2c7617aad0fa5ba59fc49f690a851d6afc0178813c49767644dd"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/ee/66/7c2690141c520db08b6a6f852fa768f421b0b50683b7bbcd88ef51f33170/numpy-1.14.0.zip"
    sha256 "3de643935b212307b420248018323a44ec51987a336d1d747c1322afc3c099fb"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/3c/ec/a94f8cf7274ea60b5413df054f82a8980523efd712ec55a59e7c3357cf7c/pyparsing-2.2.0.tar.gz"
    sha256 "0832bcf47acd283788593e7a0f542407bd9550a55a8a8435214a1960e04bcb04"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/54/bb/f1db86504f7a49e1d9b9301531181b00a1c7325dc85a29160ee3eaa73a54/python-dateutil-2.6.1.tar.gz"
    sha256 "891c38b2a02f5bb1be3e4793866c8df49c7d19baabf9c1bad62547e0b4866aca"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/60/88/d3152c234da4b2a1f7a989f89609ea488225eaea015bc16fbde2b3fdfefa/pytz-2017.3.zip"
    sha256 "fae4cffc040921b8a2d60c6cf0b5d662c1190fe54d718271db4eb17d44a185b7"
  end

  resource "Rtree" do
    url "https://files.pythonhosted.org/packages/b0/6c/6cc8d738f14d5efa0c38ec29403bbd9c75e64b3fe84b53290178dda0dbd9/Rtree-0.8.3.tar.gz"
    sha256 "6cb9cf3000963ea6a3db777a597baee2bc55c4fc891e4f1967f262cc96148649"
  end

  resource "scipy" do
    url "https://files.pythonhosted.org/packages/d0/73/76fc6ea21818eed0de8dd38e1e9586725578864169a2b31acdeffb9131c8/scipy-1.0.0.tar.gz"
    sha256 "87ea1f11a0e9ec08c264dc64551d501fa307289460705f6fccd84cbfc7926d10"
  end

  resource "Shapely" do
    url "https://files.pythonhosted.org/packages/7d/3c/0f09841db07aabf9cc387662be646f181d07ed196e6f60ce8be5f4a8f0bd/Shapely-1.6.4.post1.tar.gz"
    sha256 "30df7572d311514802df8dc0e229d1660bc4cbdcf027a8281e79c5fc2fcf02f2"
  end

  resource "simplejson" do
    url "https://files.pythonhosted.org/packages/0d/3f/3a16847fe5c010110a8f54dd8fe7b091b4e22922def374fe1cce9c1cb7e9/simplejson-3.13.2.tar.gz"
    sha256 "4c4ecf20e054716cc1e5a81cadc44d3f4027108d8dd0861d8b1e3bd7a32d4f0a"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"
    sha256 "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
  end

  resource "subprocess32" do
    url "https://files.pythonhosted.org/packages/b8/2f/49e53b0d0e94611a2dc624a1ad24d41b6d94d0f1b0a078443407ea2214c2/subprocess32-3.2.7.tar.gz"
    sha256 "1e450a4a4c53bf197ad6402c564b9f7a53539385918ef8f12bdf430a61036590"
  end

  resource "svg.path" do
    url "https://files.pythonhosted.org/packages/1d/6c/cf484a95b895a7acd3989082501c67c8f43b6f91181f2a0b7aa634d1df6f/svg.path-2.2.tar.gz"
    sha256 "bc7b75606e76f910bf0045d09a5f8415aaafff3cedd0a3ce9f0d474fe2007722"
  end
  def install
    virtualenv_install_with_resources
  end
  test do

    system "false"
  end
end
