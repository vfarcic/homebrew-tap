class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.4.2/dot-agent-deck-darwin-arm64"
      sha256 "155e44ada86aaa307a6d0529ec1c83668bacddeae1b0ff903fb690c53b609306"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.4.2/dot-agent-deck-darwin-amd64"
      sha256 "0e70242ae000bf208596231175bbe2f3440e71e5ab4b1463906951edbb27f4b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.4.2/dot-agent-deck-linux-arm64"
      sha256 "1c21f9700b63a60e9837fec64dd34a38936990ce80ffe6c1e8b11814a35caea0"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.4.2/dot-agent-deck-linux-amd64"
      sha256 "bc6fffd76620a183ed9ad7813f2f22ab54138803d0b2deed38a6e26568bd5ffa"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
