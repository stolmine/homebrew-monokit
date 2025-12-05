class Monokit < Formula
  desc "Teletype-style scripting for a SuperCollider complex oscillator voice"
  homepage "https://github.com/stolmine/monokit"
  url "https://github.com/stolmine/monokit/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6df9020b2fff3712c3a9bc31d8cd9b6357e486fe3f5d2e972c12820d1c50afee"
  license "GPL-2.0"

  depends_on "rust" => :build
  cask "supercollider"

  def install
    system "cargo", "build", "--release", "--locked"
    bin.install "target/release/monokit"
    pkgshare.install "sc"
  end

  def caveats
    <<~EOS
      SuperCollider server files installed to:
        #{pkgshare}/sc

      User config stored at:
        ~/.config/monokit/
    EOS
  end

  test do
    assert_match "monokit", shell_output("#{bin}/monokit --version 2>&1", 1)
  end
end
