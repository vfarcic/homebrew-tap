class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.37.1"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.37.1/dot-agent-deck-darwin-arm64"
      sha256 "d58a249703e41deb5abb2bc76c3c1f98b4541426b4f8eb8099a312ca9761e351"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.37.1/dot-agent-deck-darwin-amd64"
      sha256 "051ae6a38c8140b37fa046eb2f0641297898783e7618c4407047ad8fbe67e617"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.37.1/dot-agent-deck-linux-arm64"
      sha256 "7ddbcbfd4b40ef9e6590cdd29173732e7e499f572eea23ecf0ab7120e73bf74b"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.37.1/dot-agent-deck-linux-amd64"
      sha256 "54e511180a4a25f1af2d64e749d24127a7daab330e47a737d9c807a07939b318"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
