class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.36.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.36.0/dot-agent-deck-darwin-arm64"
      sha256 "d9839bbe7c203196ce0bbef9156906900d6ce6a0afc27af99bb6b19de5b1a879"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.36.0/dot-agent-deck-darwin-amd64"
      sha256 "3ae1600bc069934ff13dec39a84ea5803ba4087e3267c8573671cb4ea689c9d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.36.0/dot-agent-deck-linux-arm64"
      sha256 "fab3d01e48fe41f21b0cdf04e0e7340dc03bea7c9ae96ad3ebe6c9303942faf1"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.36.0/dot-agent-deck-linux-amd64"
      sha256 "c47f569b184ff023205cc2897b47f86555d5cf5290776851cc622c4a76015441"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
