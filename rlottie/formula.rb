class RLottie < Formula 
  desc "A platform independent standalone library that plays Lottie Animation."
  homepage "https://github.com/Samsung/rlottie"
  url "https://github.com/Samsung/rlottie/archive/refs/tags/v0.2.tar.gz"
  sha256 "030ccbc270f144b4f3519fb3b86e20dd79fb48d5d55e57f950f12bab9b65216a"
  license "MIT"

  depends_on "meson" => :build
  depends_on "ninja" => :build

  head do 
    url "https://github.com/Samsung/rlottie.git", branch: "master"
  end 

  def install 
    mkdir "build" do 
      system "meson", "..", "-Dbuildtype=release", "-Dtest=false"
      system "ninja","-C","build"
      system "ninja","install"
    end
  end

  test do 
    system "#{bin}/rlottie","--version"
  end 
end 
