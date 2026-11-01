class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.49.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.5/dot-agent-deck-darwin-arm64"
      sha256 "3cf8ffbfc3157f50f4ae556ba4daa78df8f717e2a80303683e19764c5bafa5e3"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.5/dot-agent-deck-darwin-amd64"
      sha256 "20f2bbc725e1dfb8e5daa2864431be3ac1c805ec5139a9df691ebedb9173792c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.5/dot-agent-deck-linux-arm64"
      sha256 "5021f18321be10fd0d6ac4b76e68daa286127cf554037150cea4ef4d6b77dba1"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.5/dot-agent-deck-collector-linux-arm64"
        sha256 "3b011ad27e3ce379fc9881394dbd0bb26d1f8022f79de2c6b43b8961b3d052e8"
      end
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.5/dot-agent-deck-linux-amd64"
      sha256 "568d14195a9e62671931452d7c8fb008bb966528ef3a5963fed5bf7559e42c2c"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.5/dot-agent-deck-collector-linux-amd64"
        sha256 "54675c3b518894e5fbc9f9f0eb72d784efd1c3e2a1622ba006df89ef80fa02f1"
      end
    end
  end

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
    if OS.linux?
      resource("collector").stage do
        bin.install Dir["dot-agent-deck-collector-*"].first => "dot-agent-deck-collector"
      end
    end
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
    assert_match "dot-agent-deck-collector", shell_output("#{bin}/dot-agent-deck-collector --help") if OS.linux?
  end
end
