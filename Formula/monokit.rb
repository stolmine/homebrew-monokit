class Monokit < Formula
  desc "Teletype-style scripting for a SuperCollider complex oscillator voice"
  homepage "https://github.com/stolmine/monokit"
  version "0.4.4"
  license "GPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/stolmine/monokit/releases/download/v0.4.4/monokit-0.4.4-aarch64-apple-darwin.tar.gz"
      sha256 "443dfdd60208891dd7ffe757bcec563e9e62003f59af2a90b481d46f06228a73"
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
