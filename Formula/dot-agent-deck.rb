class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.33.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.33.0/dot-agent-deck-darwin-arm64"
      sha256 "3e7a322848134d09308ea145fea1e5878c0fd58dc1b62351e0dc4c97c6bf3429"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.33.0/dot-agent-deck-darwin-amd64"
      sha256 "f17ac27b3050d07c674792a067998de9de397ce19490183320118b0956bfd7a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.33.0/dot-agent-deck-linux-arm64"
      sha256 "28edf3aef78309c03704dd96bcae929c58f38f910ac68cf75f83f2b7ae9a0905"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.33.0/dot-agent-deck-linux-amd64"
      sha256 "ef9295d75c7be89d6bbd9f6b802a01c987741b63cd892dadbe30b66dd1049ddc"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
