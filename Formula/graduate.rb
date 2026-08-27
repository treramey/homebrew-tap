class Graduate < Formula
  desc "Graduate, a Jira Cloud terminal client"
  homepage "https://github.com/treramey/graduate"
  version "1.5.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/treramey/graduate/releases/download/v1.5.0/graduate-aarch64-apple-darwin.tar.gz"
      sha256 "c28f801f4e1347dfe39aaa9d36cf0092665b5578256b6a03572aeefda5c0ad92"
    else
      url "https://github.com/treramey/graduate/releases/download/v1.5.0/graduate-x86_64-apple-darwin.tar.gz"
      sha256 "8e5354a4f18afb419b4e3df4cb122ed45e2d03670d57dc6de1c746786ffd30ac"
    end
  end
  on_linux do
    url "https://github.com/treramey/graduate/releases/download/v1.5.0/graduate-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c77b07590f95e787f23f8bce5975f7c8c24cb44cc4efd5480458323c98a99e8c"
  end
  def install
    bin.install Dir["graduate-*/gd"].first => "gd"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/gd --version")
  end
end
