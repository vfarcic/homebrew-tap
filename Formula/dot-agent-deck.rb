class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.20.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.20.2/dot-agent-deck-darwin-arm64"
      sha256 "92a5bffbe0421eb82e527c73b1e4f84829203961a3ce0270d3201d5519587cca"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.20.2/dot-agent-deck-darwin-amd64"
      sha256 "c7aba5e03c5a437de2540e48b06eec3df2abe553ba370492c065ed67feec47e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.20.2/dot-agent-deck-linux-arm64"
      sha256 "6d9c428f6111a697554ed2bb2b32e900e8002277b1e0e3601e0e811e0760f8a0"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.20.2/dot-agent-deck-linux-amd64"
      sha256 "9deb8f806a2a060fee5c2d9feedb77ddd76d6bbd88e8a16cb01cf1cda25636af"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
