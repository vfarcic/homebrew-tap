class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.51.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.3/dot-agent-deck-darwin-arm64"
      sha256 "f1adadb98f2bab2481d73117501e07592dc47fe3fa713ecdd4c5657e1f686c5d"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.3/dot-agent-deck-darwin-amd64"
      sha256 "156cd4814b4b0a28402b14b291cf48a46349902594b2695b019dc061265c3bee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.3/dot-agent-deck-linux-arm64"
      sha256 "a4aa522a607700b836963c123f4a0a7fd687726fa3ad9a2371b1f3d4d9340342"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.3/dot-agent-deck-collector-linux-arm64"
        sha256 "38f6a6a4fc5cb2be975002678eb776cc74baed33854714ebc3bba34657dfb76d"
      end
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.3/dot-agent-deck-linux-amd64"
      sha256 "48a2b5fd6450fd8cd4a051a2353b9d776aa2cc1f8aa60f37835478d75beb04e4"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.3/dot-agent-deck-collector-linux-amd64"
        sha256 "c9bac0e087b95bd1a3c7dcf71d1dffcf53e8f1cf255e07cfa7bb73b208666691"
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
