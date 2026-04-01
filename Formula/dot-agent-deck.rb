class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.9.1/dot-agent-deck-darwin-arm64"
      sha256 "74a64958852e1e0151aacd079351849bf58c6818790004b0a1eb98693f6b52d0"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.9.1/dot-agent-deck-darwin-amd64"
      sha256 "f521a42a5e78a6ce8c885fa4706a0d7a8babaa7c88774b8311c3266a1c3764d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.9.1/dot-agent-deck-linux-arm64"
      sha256 "98cf3a5bec6cf857791cf2bb44135356075edb38d001e112dce1ea5abb59d182"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.9.1/dot-agent-deck-linux-amd64"
      sha256 "18fc4f9b3236d786e2820755a4e9dcb88bb191f217632470b7fff7eff1c060db"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
