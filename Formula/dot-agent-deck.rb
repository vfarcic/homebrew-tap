class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.1.0/dot-agent-deck-darwin-arm64"
      sha256 "bb7bb8575a3560fa658c882bdfab24fb9ad433825a67c96bd7225aea6960c04b"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.1.0/dot-agent-deck-darwin-amd64"
      sha256 "54915000373d68fd61d29bcd2d5212cdcca782eefb99efa6980eb03df10a9b88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.1.0/dot-agent-deck-linux-arm64"
      sha256 "b9807036f0bbdae81fc5a168b1993af088827a6cdfca8a97975fe68e675bc043"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.1.0/dot-agent-deck-linux-amd64"
      sha256 "b44ce6acf6d0d84a93332ecb51f6d86c16ccccd9228552a9d38835d50a79f578"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
