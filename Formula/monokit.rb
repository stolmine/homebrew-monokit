class Monokit < Formula
  desc "Teletype-style scripting for a SuperCollider complex oscillator voice"
  homepage "https://github.com/stolmine/monokit"
  version "0.6.2"
  license "GPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/stolmine/monokit/releases/download/v0.6.2/monokit-0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "0474d631e290f29ade2873fecbad547d9033c0dc720208eed505728dec3b4706"
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
