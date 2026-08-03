class Graduate < Formula
  desc "Graduate, a Jira Cloud terminal client"
  homepage "https://github.com/treramey/graduate"
  version "1.3.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/treramey/graduate/releases/download/v1.3.0/graduate-aarch64-apple-darwin.tar.gz"
      sha256 "904033e079328538eca33e2555c203f7f390011220570e562b2b0d0d2eb87850"
    else
      url "https://github.com/treramey/graduate/releases/download/v1.3.0/graduate-x86_64-apple-darwin.tar.gz"
      sha256 "45015358863446ee7cd830e7653940a33273ae58342d9e228dd7df49281d62b9"
    end
  end
  on_linux do
    url "https://github.com/treramey/graduate/releases/download/v1.3.0/graduate-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "426391e0974d8c94649f0b708dd41ba6e713c919c422719e97c27178fba4b51a"
  end
  def install
    bin.install Dir["graduate-*/gd"].first => "gd"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/gd --version")
  end
end
