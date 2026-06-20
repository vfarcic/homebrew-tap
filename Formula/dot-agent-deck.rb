class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.31.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.31.0/dot-agent-deck-darwin-arm64"
      sha256 "b728c6d038dba24245b86eddf45e997f78388d9815113fc9874289d053efebac"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.31.0/dot-agent-deck-darwin-amd64"
      sha256 "9dd8d0ca7fc8c7eafeee18a3db8bf5b3afe34297517344df1a061d7399526bbc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.31.0/dot-agent-deck-linux-arm64"
      sha256 "46a0a2a30024a981b46af1c9a117ff1178559ce22ed43bfbee29468ff1b6546e"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.31.0/dot-agent-deck-linux-amd64"
      sha256 "973e34e5fc3863b3c610fcfc5a84d848f39a82819fdaad33d000a09eec085157"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
