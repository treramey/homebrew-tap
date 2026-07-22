class Drag < Formula
  desc "Fast Tempo.io Cloud command-line client"
  homepage "https://github.com/treramey/drag"
  version "0.7.2"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/treramey/drag/releases/download/v0.7.2/drag-aarch64-apple-darwin.tar.gz"
      sha256 "158e50e4d6ab81acf8fb24a7c4add7f9d4281b75be137d73196e8bf6292f84d1"
    else
      url "https://github.com/treramey/drag/releases/download/v0.7.2/drag-x86_64-apple-darwin.tar.gz"
      sha256 "288b8774983c96c867fb7b6da80500e5d68d43c4ce5a13ffdae18e54ebdf4a34"
    end
  end
  on_linux do
    url "https://github.com/treramey/drag/releases/download/v0.7.2/drag-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fa3a14f1a97d295a4edf8f9193d215b0313d2fd2ae71de59544f42cf87b17fca"
  end
  def install
    bin.install Dir["drag-*/drag"].first => "drag"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/drag --version")
  end
end
