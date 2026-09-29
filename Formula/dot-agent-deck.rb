class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.44.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.44.0/dot-agent-deck-darwin-arm64"
      sha256 "8d6a322203752d8b3d529f3fba08606847e0bf82df1ceb9c52fcef45e4e0253b"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.44.0/dot-agent-deck-darwin-amd64"
      sha256 "c54154e2c210f4944a18b2d4db3c151fa72597046c6cfd76eb10b3a51c28ce37"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.44.0/dot-agent-deck-linux-arm64"
      sha256 "ee47a554fd893b6f7cb09ea60faa93053d8fcf8049a00c053a723b7832b596dc"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.44.0/dot-agent-deck-linux-amd64"
      sha256 "ee39673ec6d51bcc9c7ae182ae5aa52229952d12bcc0d2ae79515a46e4629ee3"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
