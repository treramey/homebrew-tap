class Drag < Formula
  desc "Fast Tempo.io Cloud command-line client"
  homepage "https://github.com/treramey/drag"
  version "0.8.1"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/treramey/drag/releases/download/v0.8.1/drag-aarch64-apple-darwin.tar.gz"
      sha256 "ad47bdfe903132e24da1ddbd6821884f99f894ae5830395b7ff4696f5b4f7fe4"
    else
      url "https://github.com/treramey/drag/releases/download/v0.8.1/drag-x86_64-apple-darwin.tar.gz"
      sha256 "a9c892ffc907d20db8ad5aefa76d424ce2b64547fc77551d2d528c22dd4c2fd0"
    end
  end
  on_linux do
    url "https://github.com/treramey/drag/releases/download/v0.8.1/drag-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7f1272dd316ccc97c87b008a6c6fa64793f2b681e646240d39544098ec3ac077"
  end
  def install
    bin.install Dir["drag-*/drag"].first => "drag"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/drag --version")
  end
end
