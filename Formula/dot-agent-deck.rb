class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.34.1"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.34.1/dot-agent-deck-darwin-arm64"
      sha256 "c9bb3de096b762f4dae8b78237997fd499812fe27d4be9b5b6b3945436ff281e"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.34.1/dot-agent-deck-darwin-amd64"
      sha256 "06dba34734eca46cbc79d071248e639a8d17cca683d87a839a410dea17ca6da2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.34.1/dot-agent-deck-linux-arm64"
      sha256 "a0a2b711f19d7ee4b49431dc7dcd1737e69ed93b930a83c07ee23630a2283f1f"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.34.1/dot-agent-deck-linux-amd64"
      sha256 "0f8a71339cf5f140978de374c3e82309482302c58d985f65ec9391ac8dbed609"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
