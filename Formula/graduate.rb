class Graduate < Formula
  desc "Graduate, a Jira Cloud terminal client"
  homepage "https://github.com/treramey/graduate"
  version "1.5.1"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/treramey/graduate/releases/download/v1.5.1/graduate-aarch64-apple-darwin.tar.gz"
      sha256 "a76cf0e6b51356c3454eb18cabe536e48daa544d2a73299164a8cc77d12defb2"
    else
      url "https://github.com/treramey/graduate/releases/download/v1.5.1/graduate-x86_64-apple-darwin.tar.gz"
      sha256 "7186f26ef6bacb5f6ccf4ca0a2da19dcadae3c842546155dc152bcfcafe51da0"
    end
  end
  on_linux do
    url "https://github.com/treramey/graduate/releases/download/v1.5.1/graduate-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3462a9cb623d2b93ad9a1fe7e94e7033e4e0beea6abd2a0ed72f083f8f316889"
  end
  def install
    bin.install Dir["graduate-*/gd"].first => "gd"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/gd --version")
  end
end
