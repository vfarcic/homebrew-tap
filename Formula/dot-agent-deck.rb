class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.40.1"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.40.1/dot-agent-deck-darwin-arm64"
      sha256 "7f00a00b763ddeca85d56716144921ef08d15ed0d9c4ad15d70b6f8e43181f0a"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.40.1/dot-agent-deck-darwin-amd64"
      sha256 "d6f1336af5cbc89893f5960e2f0edb97f218c48f68cdd5d98bf93fff26515c80"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.40.1/dot-agent-deck-linux-arm64"
      sha256 "905ac454f8749efe13ff02cf7c6fd84669ef0bf0bdf5fb514add80f7c2fd2600"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.40.1/dot-agent-deck-linux-amd64"
      sha256 "66675addf1c66e2d13ef84160b35b6dee7526984968795c97b1f436ebf45ec7d"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
