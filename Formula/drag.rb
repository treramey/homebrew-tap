class Drag < Formula
  desc "Fast Tempo.io Cloud command-line client"
  homepage "https://github.com/treramey/drag"
  version "0.10.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/treramey/drag/releases/download/v0.10.0/drag-aarch64-apple-darwin.tar.gz"
      sha256 "ebe3230a349b50c97cd72f03ecd28b6434e26ce69758df47ee5af5c1a725b799"
    else
      url "https://github.com/treramey/drag/releases/download/v0.10.0/drag-x86_64-apple-darwin.tar.gz"
      sha256 "2d233721a6eacb9f89e979b1a021006c4514063936c64e06d1f244209d234025"
    end
  end
  on_linux do
    url "https://github.com/treramey/drag/releases/download/v0.10.0/drag-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "92857aa912787621c660ab5c5c57187c2f5867b9ba5c608cee7b7f4dde5e7fe0"
  end
  def install
    bin.install Dir["drag-*/drag"].first => "drag"
    bin.install Dir["drag-*/drag-tracking"].first => "drag-tracking"
    bin.install Dir["drag-*/drag-companion"].first => "drag-companion"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/drag --version")
    assert_match version.to_s, shell_output("#{bin}/drag-tracking --version")
    assert_match version.to_s, shell_output("#{bin}/drag-companion --version")
  end
end
