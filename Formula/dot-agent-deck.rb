class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.43.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.43.0/dot-agent-deck-darwin-arm64"
      sha256 "c52856e7e415e8a5a9ebaac48a8e64dea892b90a07a602bdf36ed19bf9f3d080"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.43.0/dot-agent-deck-darwin-amd64"
      sha256 "e333f3b5e095a4b2d468c8ffd94b41e04ec52895cd877ed10c65b3f927b3c0e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.43.0/dot-agent-deck-linux-arm64"
      sha256 "b59a80010f88df2205b8b176ff815b860adee69fe856572a431ece6202d715bb"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.43.0/dot-agent-deck-linux-amd64"
      sha256 "5c5da80e7a0a31e89997e4dac188bce36ac72db5186aaecfb9da5447a19de721"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
