class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.11.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.3/dot-agent-deck-darwin-arm64"
      sha256 "c654430b90d2323f6c1c452c64e12c224f1852504476c5b9c4765faccbc283a1"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.3/dot-agent-deck-darwin-amd64"
      sha256 "9bf92fa7802b19ed69da33f7c5e525a1a2613d2c38f254ac2a8dcf9060f32042"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.3/dot-agent-deck-linux-arm64"
      sha256 "6e9de1f2cfb9a68946250659dd3f76d0e86e0106ba0b5b23bbeb65bee5f1a1ab"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.3/dot-agent-deck-linux-amd64"
      sha256 "46c2db4ee524feb897ed70c55110e8296506e1c5aebcdd86bb819c7ccff550cc"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
