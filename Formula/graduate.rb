class Graduate < Formula
  desc "Graduate, a Jira Cloud terminal client"
  homepage "https://github.com/treramey/graduate"
  version "1.2.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/treramey/graduate/releases/download/v1.2.0/graduate-aarch64-apple-darwin.tar.gz"
      sha256 "14ad481e85722305adc5458d7217860946178fd327d5b7f4b770cd848a4f9c83"
    else
      url "https://github.com/treramey/graduate/releases/download/v1.2.0/graduate-x86_64-apple-darwin.tar.gz"
      sha256 "b0dd074a5d4f825a6fadca726d43814c23e24b284290799a5d53d37084ac8c7d"
    end
  end
  on_linux do
    url "https://github.com/treramey/graduate/releases/download/v1.2.0/graduate-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d7c6a981d8f5f57182e4acb481195eb31b8faa9f6454fe3f2f38dbe10c30d2aa"
  end
  def install
    bin.install Dir["graduate-*/gd"].first => "gd"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/gd --version")
  end
end
