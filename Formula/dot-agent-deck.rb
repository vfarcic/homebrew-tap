class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.7.0/dot-agent-deck-darwin-arm64"
      sha256 "609145fa13c8025c136eff4c44d0c348600b7156218ad0a149887812deb0d651"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.7.0/dot-agent-deck-darwin-amd64"
      sha256 "f7d88cf26c60473b0a7038309245fac155f8a5876c2a024c08a11df48d96b73c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.7.0/dot-agent-deck-linux-arm64"
      sha256 "dd16fd961b367e0784e01d8bfd300db2f5232100578a8de61264f0f5ab69d8a5"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.7.0/dot-agent-deck-linux-amd64"
      sha256 "967c18b662115d2c87d254ed9f74abf5f07b0ea43b633d103bc9f240a37858e9"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
