class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.21.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.21.0/dot-agent-deck-darwin-arm64"
      sha256 "2ba7decfd1c90415ac98823676ceb4914ff20a44e280e7a68816ca948de285b4"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.21.0/dot-agent-deck-darwin-amd64"
      sha256 "f8c2259106328d3e9456413fc00b5915e143cfe2826cccb499965919f9ba8a5d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.21.0/dot-agent-deck-linux-arm64"
      sha256 "4909f45d999d45bc6e187c24f3e99df14ff1e792d9158ece706d0fc7dff945bf"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.21.0/dot-agent-deck-linux-amd64"
      sha256 "734eff905a0eae61780cf643e845a409808d9ab2ace8cf253ba0b38f18e0046e"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
