class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.42.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.42.0/dot-agent-deck-darwin-arm64"
      sha256 "866f1c31ee6f1eb37506e4b8b3bebfe2714a14ef5cb109326bc555ff278bd3ae"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.42.0/dot-agent-deck-darwin-amd64"
      sha256 "8939cab41f650e6ef8e5b4cafdd0fc8d931766d48bc228266619fc882c9505b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.42.0/dot-agent-deck-linux-arm64"
      sha256 "8ec6d0872ddf5a6700633d9021247f45c4abf7ffd5aa2748906ada3d0157aa8a"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.42.0/dot-agent-deck-linux-amd64"
      sha256 "625359499586f6cfd3fbf4e53c1cffa636b55f683f7eac93d451771547c427c6"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
