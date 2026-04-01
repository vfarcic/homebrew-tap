class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.6.1/dot-agent-deck-darwin-arm64"
      sha256 "a27e20504f09f7c6a2dc977fa8f8b76e534f37a164cd5b0959e5b7fd314c0a35"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.6.1/dot-agent-deck-darwin-amd64"
      sha256 "f3da8246d4f7ff73faeb561e67a47f6c881ac646db177f18229529c122fb7f55"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.6.1/dot-agent-deck-linux-arm64"
      sha256 "fbcbc71164769a169f33f3f06a2aa7386f82a62c140e38b72d24e91e26f53bb1"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.6.1/dot-agent-deck-linux-amd64"
      sha256 "e271addd5c689e01eea0cdf75bef5453029ab0385a98cac4897e7a0d37c56bed"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
