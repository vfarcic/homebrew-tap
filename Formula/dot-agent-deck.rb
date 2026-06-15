class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.30.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.30.0/dot-agent-deck-darwin-arm64"
      sha256 "e740eb7b925c4927bd9cdd2df5373d5d7ab4c021dd25be8dc6b9ec0aaef0cc42"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.30.0/dot-agent-deck-darwin-amd64"
      sha256 "409caa1f026d98fcb86b8a023bc9e3a96ae28ba5bd9176a57b57e2a75f7d5e03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.30.0/dot-agent-deck-linux-arm64"
      sha256 "9472f5332dd0007b6380040bd725d539acdaf47a8c260fe0cbdbe702ea3ce3f4"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.30.0/dot-agent-deck-linux-amd64"
      sha256 "17bdc95cd92bd6144ac0b00492ce7060cfbce67e60971787f33a1b63f181f292"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
