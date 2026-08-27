class Graduate < Formula
  desc "Graduate, a Jira Cloud terminal client"
  homepage "https://github.com/treramey/graduate"
  version "1.4.1"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/treramey/graduate/releases/download/v1.4.1/graduate-aarch64-apple-darwin.tar.gz"
      sha256 "e0cd2b3c1952b26306be020a606be244ded4964c83b5d5fd145b0c80af0d72c2"
    else
      url "https://github.com/treramey/graduate/releases/download/v1.4.1/graduate-x86_64-apple-darwin.tar.gz"
      sha256 "2268e2ea2b30c4c1f7bcc531cd67857988b762d6a8f39a287055173438895513"
    end
  end
  on_linux do
    url "https://github.com/treramey/graduate/releases/download/v1.4.1/graduate-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "55c4d417e384c1df3e5565baa715ca6f350bd79a9bdc4cb9af1a29f745b864b1"
  end
  def install
    bin.install Dir["graduate-*/gd"].first => "gd"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/gd --version")
  end
end
