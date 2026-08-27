class Graduate < Formula
  desc "Graduate, a Jira Cloud terminal client"
  homepage "https://github.com/treramey/graduate"
  version "1.4.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/treramey/graduate/releases/download/v1.4.0/graduate-aarch64-apple-darwin.tar.gz"
      sha256 "d76ee5efea6e885777476873ebf80b1546e2d29c30beb93facd16cd07198a5e9"
    else
      url "https://github.com/treramey/graduate/releases/download/v1.4.0/graduate-x86_64-apple-darwin.tar.gz"
      sha256 "9ba0ea3ee56b6c41728acb641edb3fab50704afc11975248ed7d9ef12b9708cd"
    end
  end
  on_linux do
    url "https://github.com/treramey/graduate/releases/download/v1.4.0/graduate-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6689489068e53819be7622b0fb7e90ae1ab78cdd55874beaa459927cc7f492ce"
  end
  def install
    bin.install Dir["graduate-*/gd"].first => "gd"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/gd --version")
  end
end
