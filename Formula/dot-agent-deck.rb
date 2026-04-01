class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.7.1/dot-agent-deck-darwin-arm64"
      sha256 "dbf47e7fdac4787c07d6f52952b34c1fc4679d0863ef1d3ab93bda57ac559dcb"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.7.1/dot-agent-deck-darwin-amd64"
      sha256 "2eace5af458faaf1fd3ada1165e30b30b3be48b50a10765ac02e82deebacd486"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.7.1/dot-agent-deck-linux-arm64"
      sha256 "268aa84bc848e044d66aac919815cf2da5c0513218c6b90d6c8b4080ab3b298e"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.7.1/dot-agent-deck-linux-amd64"
      sha256 "ea3f1f7909fcfd5661503a1d48ea77c3e17d7a0bdd9949dc5cb28b8810ca8538"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
