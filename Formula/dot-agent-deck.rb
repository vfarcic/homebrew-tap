class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.46.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.46.0/dot-agent-deck-darwin-arm64"
      sha256 "6e67186914c91aa03b70bce9e295b435c4e5cab0a6198a4a67601a01b500f0a7"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.46.0/dot-agent-deck-darwin-amd64"
      sha256 "b8dd38e812f4b682d0806b3cc773eec0a4fa758be53617488701a3a7c8f21042"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.46.0/dot-agent-deck-linux-arm64"
      sha256 "8c0f5442f8ee2e93f21d32e93285e1f77380af77513cecb0d3fc803a70067c73"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.46.0/dot-agent-deck-linux-amd64"
      sha256 "8640c04108699aceea4df8c578ba1acaf742b8c88f63016f0a2bc20811084877"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
