class Graduate < Formula
  desc "Graduate, a Jira Cloud terminal client"
  homepage "https://github.com/treramey/graduate"
  version "1.7.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/treramey/graduate/releases/download/v1.7.0/graduate-aarch64-apple-darwin.tar.gz"
      sha256 "227d86655744d5883d533dfccf538927776ca5e0e32fc307596c0369dbb8f83c"
    else
      url "https://github.com/treramey/graduate/releases/download/v1.7.0/graduate-x86_64-apple-darwin.tar.gz"
      sha256 "a2575b43429e0141593def562cfb038b8a31315abb3de7eb4c523a8ebb751a70"
    end
  end
  on_linux do
    url "https://github.com/treramey/graduate/releases/download/v1.7.0/graduate-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f5935074ea61d565ac11dce003a1205567242c256bbb97f1afea9f2f28a4de64"
  end
  def install
    bin.install Dir["graduate-*/gd"].first => "gd"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/gd --version")
  end
end
