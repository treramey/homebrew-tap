class Graduate < Formula
  desc "Graduate, a Jira Cloud terminal client"
  homepage "https://github.com/treramey/graduate"
  version "1.1.1"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/treramey/graduate/releases/download/v1.1.1/graduate-aarch64-apple-darwin.tar.gz"
      sha256 "967607f27578db84b0c4735cab951b474b6b0e0d7edc62647370397034db42a5"
    else
      url "https://github.com/treramey/graduate/releases/download/v1.1.1/graduate-x86_64-apple-darwin.tar.gz"
      sha256 "64a3c5c5c02e45929de64ab11701af03cb44a5716642a5e9ddc1d92fba9c2ff6"
    end
  end
  on_linux do
    url "https://github.com/treramey/graduate/releases/download/v1.1.1/graduate-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "deeb7a687c561dfaf103143ac06bc9bc64505a38416d14774660d6ce5a42a85c"
  end
  def install
    bin.install Dir["graduate-*/gd"].first => "gd"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/gd --version")
  end
end
