class Monokit < Formula
  desc "Teletype-style scripting for a SuperCollider complex oscillator voice"
  homepage "https://github.com/stolmine/monokit"
  version "0.2.0"
  license "GPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/stolmine/monokit/releases/download/v0.2.0/monokit-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "5036cf088a92a2201f65ab171e74d54de09127234b99aeb5f9380c2c75b4b89d"
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
