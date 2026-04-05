class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.14.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.2/dot-agent-deck-darwin-arm64"
      sha256 "3623bdcef194951a663a1b1d95a9bce40bf73223baa7aa701612f0ae4dbc7881"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.2/dot-agent-deck-darwin-amd64"
      sha256 "b970b416ead6fde4bca1aea2f735a3a3442d369b90d0667d233d575236d3d185"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.2/dot-agent-deck-linux-arm64"
      sha256 "fa43a69a97b068c09bc27cf68d18c98c3ce51995012321e71ed46bb21f9d0394"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.2/dot-agent-deck-linux-amd64"
      sha256 "3a258f137cc48b565cec959de4af918f9d53d9f9390cb7d8531b75e22b7100e4"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
