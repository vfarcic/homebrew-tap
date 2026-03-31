class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.3.1/dot-agent-deck-darwin-arm64"
      sha256 "b6ce90d989666c02affa75a62c1a37f5c0682ff2eb2c0c9b84980cdb537531e4"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.3.1/dot-agent-deck-darwin-amd64"
      sha256 "86606ce8848c2a7877d64622d7368f36f163c14fbf6beb036da38b61ff50d2ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.3.1/dot-agent-deck-linux-arm64"
      sha256 "45543bac5f6381bdba66e209c12e3d386043c26540a8c4eead5a8396ed12c64b"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.3.1/dot-agent-deck-linux-amd64"
      sha256 "8da8fd556e70d27f138d98d088b74482c8a21c25592e515a3279f5998ef2b1c3"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
