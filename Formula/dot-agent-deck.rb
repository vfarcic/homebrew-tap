class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.35.6"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.6/dot-agent-deck-darwin-arm64"
      sha256 "d5489bfae92e801fd2521e67b28cbaa7d036a0f973267476c1b6c9e80e4db654"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.6/dot-agent-deck-darwin-amd64"
      sha256 "0d3a8e0855af5c784b9e08ad41e812edd7f83faaf22c124ee7a99f0421381561"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.6/dot-agent-deck-linux-arm64"
      sha256 "f14164b30c6be72e8220b2113e9af551d21cdc483db4f01ba3b06a55e8e47959"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.6/dot-agent-deck-linux-amd64"
      sha256 "f58c6a741d0b3c605c4f6bde5fac93d5959157a4242f8121e5c8a1510ee6a42e"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
