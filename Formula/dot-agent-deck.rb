class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.32.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.32.0/dot-agent-deck-darwin-arm64"
      sha256 "68afaa4f740bff44b7dd0276f897870918c195001ca051caff1e48ed1ea4ae17"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.32.0/dot-agent-deck-darwin-amd64"
      sha256 "1d42c65b12e97ad9601f86d4127e3850f3793def0ce56f7e44833b1a3172a3df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.32.0/dot-agent-deck-linux-arm64"
      sha256 "c55069a03418d7d2ad4a9d5dd05ae7b20e159205a23d4a0d45b6f6202a0313d8"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.32.0/dot-agent-deck-linux-amd64"
      sha256 "25feea32f850dc3da664c7696b55a87dc267c84a6e2e16d447a02be71b04ae76"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
