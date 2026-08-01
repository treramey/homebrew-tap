class Graduate < Formula
  desc "Graduate, a Jira Cloud terminal client"
  homepage "https://github.com/treramey/graduate"
  version "1.1.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/treramey/graduate/releases/download/v1.1.0/graduate-aarch64-apple-darwin.tar.gz"
      sha256 "59b23c7951d59b81ad151c029a7591e79237ebe43fa7b8ef540df697f37e0ddb"
    else
      url "https://github.com/treramey/graduate/releases/download/v1.1.0/graduate-x86_64-apple-darwin.tar.gz"
      sha256 "dd20849cba8c50b7cd4180b51423c7bf199bf1897b15c9c9447c8712d901537d"
    end
  end
  on_linux do
    url "https://github.com/treramey/graduate/releases/download/v1.1.0/graduate-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "810c77db21ec0d2572594d61b51b5871b269a1048977b9cbf54f9f15265dbb0a"
  end
  def install
    bin.install Dir["graduate-*/gd"].first => "gd"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/gd --version")
  end
end
