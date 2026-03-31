class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.4.1/dot-agent-deck-darwin-arm64"
      sha256 "b37c5dcb81aefe6e064f97a8b2b654abb1abfa84f057b8d3153527ae1bcee63d"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.4.1/dot-agent-deck-darwin-amd64"
      sha256 "bf99ba27848522798748420b34a3fff993c59563ad923c8cd90c7816ca58ba1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.4.1/dot-agent-deck-linux-arm64"
      sha256 "4989ada3beab6c77c534268dbd415108e1d89da2eaf89ecc655a038ecd74f67a"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.4.1/dot-agent-deck-linux-amd64"
      sha256 "85971071e09cfe3271d208ede7ee78384196383dccdb8613bc7af31e462f81a1"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
