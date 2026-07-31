class Graduate < Formula
  desc "Graduate, a Jira Cloud terminal client"
  homepage "https://github.com/treramey/graduate"
  version "1.0.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/treramey/graduate/releases/download/v1.0.0/graduate-aarch64-apple-darwin.tar.gz"
      sha256 "fa7c73cb50cb18a682f5c1b8743017f3da6e4f7a389fe1bcad48ce6fb7a0ff08"
    else
      url "https://github.com/treramey/graduate/releases/download/v1.0.0/graduate-x86_64-apple-darwin.tar.gz"
      sha256 "6e58c4dbb308bb36148d27c6bfaf140875c810f7815ccda1cc4fa29b11faa101"
    end
  end
  on_linux do
    url "https://github.com/treramey/graduate/releases/download/v1.0.0/graduate-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "25a7a1d7e20f10bdc64d0d7c0a500168879759a0da4d3d9dafa6a72da1bc0555"
  end
  def install
    bin.install Dir["graduate-*/gd"].first => "gd"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/gd --version")
  end
end
