class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.1.1/dot-agent-deck-darwin-arm64"
      sha256 "80326615e8c8fcf1bca36ab6d0365666f8894c6d3d7b5508949ff0245fed1a8e"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.1.1/dot-agent-deck-darwin-amd64"
      sha256 "be0a38ef9b5b331043d0eacdae28b576e9e4c47ab803d5e14ae693e9aa590092"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.1.1/dot-agent-deck-linux-arm64"
      sha256 "8c6da88f9f18e303c0fb9b8d99c267d6a5bc5487f602519ef17511ca7723caf1"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.1.1/dot-agent-deck-linux-amd64"
      sha256 "a4b7134cbc94b65074389d85984042b9ca31a33f5e37e2cf63c16cd01ec7b7cb"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
