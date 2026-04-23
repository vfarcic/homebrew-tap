class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.23.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.23.0/dot-agent-deck-darwin-arm64"
      sha256 "1134d5a3a1b3458288963f61c98b3e1639e52ed39d2b056294df86def980e4c3"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.23.0/dot-agent-deck-darwin-amd64"
      sha256 "c75246f4c60a36d893ebca0d4afab370c2ba1b01edfcf54f39789007c201283e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.23.0/dot-agent-deck-linux-arm64"
      sha256 "7a872db2ef3276f1dba0b3bc265e92c358914500989b158453e4cbabbfdbd634"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.23.0/dot-agent-deck-linux-amd64"
      sha256 "6526ff69855e25c8624ab122100a55ce4a9a83f13467107ef2d1f5bf3f341ae5"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
