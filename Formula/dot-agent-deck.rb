class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.16.0/dot-agent-deck-darwin-arm64"
      sha256 "dc134b99865af1615c04a759f6454f68ced7d51428601413c0c9a48adfbb2f59"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.16.0/dot-agent-deck-darwin-amd64"
      sha256 "f328fc1af7215f348243df382fb9329a8056bec7380f9e6db3cce144d115c6df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.16.0/dot-agent-deck-linux-arm64"
      sha256 "8a6273e6a78a5e039b9b0c8605eed98572ef217dc4cec2b4bf0ba9a4f60cb2f0"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.16.0/dot-agent-deck-linux-amd64"
      sha256 "52bb96992fef6d519e9557227ac11dd17658c3cce55724eb635e6cad81f1618d"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
