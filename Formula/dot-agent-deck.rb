class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.35.8"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.8/dot-agent-deck-darwin-arm64"
      sha256 "e6db531ec7389246c2cf8b59aba5851b0e7704fe0189710b3e1fb6bbd5ca805e"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.8/dot-agent-deck-darwin-amd64"
      sha256 "67dec93f13005b390996977bbdcdee8b239b91173628e59d804a0ea2f0ebd024"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.8/dot-agent-deck-linux-arm64"
      sha256 "b8ea54bc7393254f5443d1ad90d6802c9fe63d94301d2ca5327df78a4a55404e"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.8/dot-agent-deck-linux-amd64"
      sha256 "3876aaba09db94c5ae240c692ed2bc95c79d8847b63bfa582dc35ff8dbec7fd8"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
