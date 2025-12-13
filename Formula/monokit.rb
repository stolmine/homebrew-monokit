class Monokit < Formula
  desc "Teletype-style scripting for a SuperCollider complex oscillator voice"
  homepage "https://github.com/stolmine/monokit"
  version "0.3.5"
  license "GPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/stolmine/monokit/releases/download/v0.3.5/monokit-0.3.5-aarch64-apple-darwin.tar.gz"
      sha256 "e4adb2d8ae97fd8a561bfdbe814a63a8c678d56e65b6144b5a89a598927e46cc"
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
