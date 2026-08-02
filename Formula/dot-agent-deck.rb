class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.35.4"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.4/dot-agent-deck-darwin-arm64"
      sha256 "ca0abf2438e5c73bea163622fd67f9d293704c7bd94ac0c850f6301a6e510f2e"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.4/dot-agent-deck-darwin-amd64"
      sha256 "3b41d5de96ad7bccfec67d4d2180f8b3eac504b8e5529cdf47ddf43844a3b232"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.4/dot-agent-deck-linux-arm64"
      sha256 "aecb35a0e17f8356c9cdda061f39538f4313015d792a589309e320e99fe0a9d1"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.4/dot-agent-deck-linux-amd64"
      sha256 "139219432f1a122b44520cbd209e6c20f5d8539eaad76dfb3bc67201ef61aa8d"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
