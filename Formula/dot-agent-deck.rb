class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.25.1"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.25.1/dot-agent-deck-darwin-arm64"
      sha256 "b0283b2add53ee9ef1b483a95f587b4b0fc375405303eddd7821aa59c85e7ddd"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.25.1/dot-agent-deck-darwin-amd64"
      sha256 "ad8102fe8e88f338996a4d0149f67dfbe2549d12d1ade06f2b6fd8947de0ad20"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.25.1/dot-agent-deck-linux-arm64"
      sha256 "e594c2f4ab5c01a9fc1115cd2d771d040f4cd12c03595a3e91b5fe8292b59d0c"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.25.1/dot-agent-deck-linux-amd64"
      sha256 "9913d6ed054b723938136ef55c62740a559e3140e75d14b86e2c86848da48d37"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
