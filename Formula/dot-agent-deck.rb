class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.49.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.0/dot-agent-deck-darwin-arm64"
      sha256 "78a447d3904c1d034a04b4af685c481c551871739045ef721278c93637ac0941"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.0/dot-agent-deck-darwin-amd64"
      sha256 "e78f2b81d38cddf4bdbea85788181fdd8445d28e58820f5ecf266f44a6446fe1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.0/dot-agent-deck-linux-arm64"
      sha256 "7d17bca1b208c0a6a044c78a2835e9af3aec1c1de82915717c91451706a7b14e"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.0/dot-agent-deck-linux-amd64"
      sha256 "a690526f4f429c55ba4c20f8ca684706f98a165b02ebe39da944e8c789940de4"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
