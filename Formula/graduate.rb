class Graduate < Formula
  desc "Graduate, a Jira Cloud terminal client"
  homepage "https://github.com/treramey/graduate"
  version "1.2.1"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/treramey/graduate/releases/download/v1.2.1/graduate-aarch64-apple-darwin.tar.gz"
      sha256 "3603cc021cdc96975f21d232b088833b8bda096f887a7ce037bf7b992315967e"
    else
      url "https://github.com/treramey/graduate/releases/download/v1.2.1/graduate-x86_64-apple-darwin.tar.gz"
      sha256 "225db2b8d425e1af5e112a80c636d89a50ca731d0a6b5f4903cb1952399c93ab"
    end
  end
  on_linux do
    url "https://github.com/treramey/graduate/releases/download/v1.2.1/graduate-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1b7350df056db10fc174a3fd13311167596fcafd644ea6d11a44d1dd68744eef"
  end
  def install
    bin.install Dir["graduate-*/gd"].first => "gd"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/gd --version")
  end
end
