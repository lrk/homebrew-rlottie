class Rlottie < Formula
  desc "Platform independent standalone library that plays Lottie Animation"
  homepage "https://github.com/Samsung/rlottie"
  url "https://github.com/Samsung/rlottie/archive/refs/tags/v0.2.tar.gz"
  sha256 "030ccbc270f144b4f3519fb3b86e20dd79fb48d5d55e57f950f12bab9b65216a"
  license "MIT"

  livecheck do
    url "https://github.com/Samsung/rlottie/releases"
    strategy :page_match
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  depends_on "meson" => :build
  depends_on "ninja" => :build

  def install
    system "meson", "setup", "--prefix=#{prefix}", "-Dbuildtype=release", "-Dtest=false", "build"
    system "ninja", "-C", "build"
    system "ninja", "-C", "build", "install"
  end
end
