class Drag < Formula
  desc "Fast Tempo.io Cloud command-line client"
  homepage "https://github.com/treramey/drag"
  version "0.9.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/treramey/drag/releases/download/v0.9.0/drag-aarch64-apple-darwin.tar.gz"
      sha256 "1b646cc12c6c971c3b1918a5bf96cc728e2045c6a025e59613f17aeac2c2628c"
    else
      url "https://github.com/treramey/drag/releases/download/v0.9.0/drag-x86_64-apple-darwin.tar.gz"
      sha256 "608f683cccc585361f90cdc43ffc189df866bee128776d968355493b85bfc6cf"
    end
  end
  on_linux do
    url "https://github.com/treramey/drag/releases/download/v0.9.0/drag-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "595e9dbf7b3b577be5bd80d254b53ad276d28d4722754584dc8b53d22ca2a69e"
  end
  def install
    bin.install Dir["drag-*/drag"].first => "drag"
    bin.install Dir["drag-*/drag-companion"].first => "drag-companion"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/drag --version")
    assert_match version.to_s, shell_output("#{bin}/drag-companion --version")
  end
end
