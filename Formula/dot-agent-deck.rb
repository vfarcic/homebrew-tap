class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.28.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.28.0/dot-agent-deck-darwin-arm64"
      sha256 "9699cf23a078d251c02da6c3dbad771986030cfde1f7f188c1a5044593c226db"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.28.0/dot-agent-deck-darwin-amd64"
      sha256 "3cab0f33a0d26b5f9447b32bd70a0f90687918a0d16fec5dbbff1af87f4f7ac6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.28.0/dot-agent-deck-linux-arm64"
      sha256 "20b2a5f0834ca914c95c870cd2e6a867d7cf8246a5b5b8aa06223b403006b25c"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.28.0/dot-agent-deck-linux-amd64"
      sha256 "ed3b5035ac00885d611d3d71468191e1679751f189d7f6493fe777e67e81f902"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
