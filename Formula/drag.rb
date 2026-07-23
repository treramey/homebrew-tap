class Drag < Formula
  desc "Fast Tempo.io Cloud command-line client"
  homepage "https://github.com/treramey/drag"
  version "0.8.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/treramey/drag/releases/download/v0.8.0/drag-aarch64-apple-darwin.tar.gz"
      sha256 "9b61d2e1fe644825ff960ab0d13a9a1255572bda610f89be9e09236e7608e63f"
    else
      url "https://github.com/treramey/drag/releases/download/v0.8.0/drag-x86_64-apple-darwin.tar.gz"
      sha256 "12e4e252cfcbab7fdff83760bee5a6bf9f529dcb4052e3dfca113d35da2ad0f8"
    end
  end
  on_linux do
    url "https://github.com/treramey/drag/releases/download/v0.8.0/drag-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dbc8220f5cb1a3b4ae30d0ba684d66cd6036a919dc7305ecfc40165f42992982"
  end
  def install
    bin.install Dir["drag-*/drag"].first => "drag"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/drag --version")
  end
end
