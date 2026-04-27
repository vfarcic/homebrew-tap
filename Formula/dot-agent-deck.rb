class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.24.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.0/dot-agent-deck-darwin-arm64"
      sha256 "8ad3584990a82e77c039d0ebd3ac99ac430984daff4babad4d4efb8766fa6425"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.0/dot-agent-deck-darwin-amd64"
      sha256 "096b33672f433bc7d0767bae4c82dce8acd731755cf502d16ea7a6744f4bbe37"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.0/dot-agent-deck-linux-arm64"
      sha256 "0ebf2fb053318e2982a03d7160f1dfa2885e35e83dec47d6cee8567d0dfcd102"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.0/dot-agent-deck-linux-amd64"
      sha256 "555e8d0f8138e0964471aa7c2000a61579d7d85bc6630bd5372a5f76b3900a58"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
