class Graduate < Formula
  desc "Graduate, a Jira Cloud terminal client"
  homepage "https://github.com/treramey/graduate"
  version "1.6.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/treramey/graduate/releases/download/v1.6.0/graduate-aarch64-apple-darwin.tar.gz"
      sha256 "ee86e89e8503cd5e83048fcce53b17ffaa4f9396dc3921b63e8c98901b76f8a3"
    else
      url "https://github.com/treramey/graduate/releases/download/v1.6.0/graduate-x86_64-apple-darwin.tar.gz"
      sha256 "0a958ec85473779a856f73e2337b6a9b062e9b28c5398a2704badad9bd640ca6"
    end
  end
  on_linux do
    url "https://github.com/treramey/graduate/releases/download/v1.6.0/graduate-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3f421c7c77ae00cc3bca0adfa01061d978ddb81dd2ea67396d2dfeb8a44f60f4"
  end
  def install
    bin.install Dir["graduate-*/gd"].first => "gd"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/gd --version")
  end
end
