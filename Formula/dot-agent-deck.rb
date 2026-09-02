class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.39.1"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.1/dot-agent-deck-darwin-arm64"
      sha256 "e8a62d12391821811da0516027d201ffe620b7babf272b74a8b9ef13e952e09c"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.1/dot-agent-deck-darwin-amd64"
      sha256 "207df75ec0e36672390464301db63d2a2149aa1e09125580988d1a8233075107"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.1/dot-agent-deck-linux-arm64"
      sha256 "a81e9854e9d6712519e51e6bc7a4311d6236c9cd650e795176686ff1b8f0fe8d"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.1/dot-agent-deck-linux-amd64"
      sha256 "23bdbd0cbf116a4b0cbf8b8289461aa4f0af3de9c6b6f450780d68d5698597e6"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
