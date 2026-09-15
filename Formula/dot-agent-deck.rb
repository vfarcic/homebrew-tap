class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.40.2"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.40.2/dot-agent-deck-darwin-arm64"
      sha256 "fcd05db69bf06a7213373275b95c338ef74e9eeb5be2d1abf68cd5aab304ea37"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.40.2/dot-agent-deck-darwin-amd64"
      sha256 "dd3c5f402c6fcade040aa84068b70ca2d5ac1e9582e5615cd2ff1b8c7901f480"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.40.2/dot-agent-deck-linux-arm64"
      sha256 "acadf2e21368dc704ac6047bb6d2db0afe9d330b350103b96a279f311d6bf1d6"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.40.2/dot-agent-deck-linux-amd64"
      sha256 "1d6ed4253a68bffddf0ef53c4309e90b38e0cd2a02f43a928ed766177eead153"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
