class Monokit < Formula
  desc "Teletype-style scripting for a SuperCollider complex oscillator voice"
  homepage "https://github.com/stolmine/monokit"
  version "0.4.3"
  license "GPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/stolmine/monokit/releases/download/v0.4.3/monokit-0.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "9d17ce698f898454e2da3a364e487c15c9bcc6b36b7ee3846fefb8db5e3e9e6e"
    end
  end

  def install
    # Install everything to libexec to keep bundle structure intact
    libexec.install "monokit", "Resources", "Frameworks"
    # Symlink binary to bin
    bin.install_symlink libexec/"monokit"
  end

  def caveats
    <<~EOS
      Self-contained bundle - no SuperCollider installation required.

      User config stored at:
        ~/.config/monokit/
    EOS
  end

  test do
    assert_match "monokit", shell_output("#{bin}/monokit --version 2>&1", 1)
  end
end
