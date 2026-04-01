class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.6.0/dot-agent-deck-darwin-arm64"
      sha256 "bc90f75b4caa536e68609740acba603d06d2092a5026422c0f2287e1c1a7d647"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.6.0/dot-agent-deck-darwin-amd64"
      sha256 "70179329e97227f476320f200fccd468a9c4f94f055d651e7ef8316bd956d2ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.6.0/dot-agent-deck-linux-arm64"
      sha256 "af3cd1e198ee58792d7399ad3684df57db7a35202872951ef71e55cb446c2298"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.6.0/dot-agent-deck-linux-amd64"
      sha256 "74c3c3c8fcd580e827c10be47d9c53feba65160280d3b20a8a77a1d012e2e655"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
