class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.47.1"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.47.1/dot-agent-deck-darwin-arm64"
      sha256 "fbb0fc73634877637450e6e3e8799a7dfd52d2778e76dfc458a64e9957efaa66"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.47.1/dot-agent-deck-darwin-amd64"
      sha256 "dc5cd8e463dac55033bf7b9f5fc76c27badf8eb182e19aa850406679972caa03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.47.1/dot-agent-deck-linux-arm64"
      sha256 "4c1c451306c64cee9a41d463bb27b84ba70cd611f7f542107460b5d1f62bb6ca"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.47.1/dot-agent-deck-linux-amd64"
      sha256 "8aad3722835162fe760d91b218b2436d52aa984b2db04eca67f2f4290927be13"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
