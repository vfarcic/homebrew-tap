class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.35.9"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.9/dot-agent-deck-darwin-arm64"
      sha256 "b66cc3cac37745f091c94ea2a48491a30256dd38e1ded74f260c6900f68df6c8"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.9/dot-agent-deck-darwin-amd64"
      sha256 "dff969382c81c1b9e1475645e90bc418e587278e709351f7d6c6181413d8f187"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.9/dot-agent-deck-linux-arm64"
      sha256 "8b90a555daacb30f8b7c6df6732dbcc216afe0bc006cc1411954e57d1ff38acf"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.9/dot-agent-deck-linux-amd64"
      sha256 "70f582170d7a94ad60ad7f281ed3f16b291bef9693d01fbb0b2c64ecbd1ec223"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
