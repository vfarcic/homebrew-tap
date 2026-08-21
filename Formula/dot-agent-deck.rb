class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.37.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.37.0/dot-agent-deck-darwin-arm64"
      sha256 "6a65bdafa4cb51224bab017a031c7244d6d89a92e44a186b953eb6f706c6dea6"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.37.0/dot-agent-deck-darwin-amd64"
      sha256 "7b0c186eba3957c8a49d922183defcc6d31a5fdc41e5314b3d4953fe588d9826"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.37.0/dot-agent-deck-linux-arm64"
      sha256 "79f47b0ca7086fd58725e16070a55919e18c497313a1d5178e9ebe60b900653f"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.37.0/dot-agent-deck-linux-amd64"
      sha256 "b5e98e4efc3550f3ab62ec498952ac9118c507477561cc6f841a2610dffbf160"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
