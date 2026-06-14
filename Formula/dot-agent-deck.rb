class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.29.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.29.0/dot-agent-deck-darwin-arm64"
      sha256 "182a167f35eeed07794919d5c0248e88eb1c5a330472d267abdfec1b40f35817"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.29.0/dot-agent-deck-darwin-amd64"
      sha256 "bfd7bfc57d51bde94f9bfbf1fd6791dd4efa3d0f99d6c85e105723aab5f445ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.29.0/dot-agent-deck-linux-arm64"
      sha256 "08be10cacd0d1514e57b25ddeb360a2537a38095cf8ed024abcac22283f4c1bc"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.29.0/dot-agent-deck-linux-amd64"
      sha256 "7e30eba0cedbc8739c56855528317508d1f9686fbea22a5d2d050a5c8297e9be"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
