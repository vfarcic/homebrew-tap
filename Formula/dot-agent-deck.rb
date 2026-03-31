class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.5.0/dot-agent-deck-darwin-arm64"
      sha256 "f61852b4b5ec5cdb1e51eecca12e74716c94b4f68e02e91ef6371b946396faef"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.5.0/dot-agent-deck-darwin-amd64"
      sha256 "d6406b920f6e716732acf9cbb6431031ab1c1a40a58fc8b73a30451fb2b3112d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.5.0/dot-agent-deck-linux-arm64"
      sha256 "d443355391a337bb0295bf3f7318e9806f2d1b18677ff972dfca6e2d6e88614e"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.5.0/dot-agent-deck-linux-amd64"
      sha256 "ca2b7ba233861536ea2eeaa7513cd8c782c54612ea0fb5c48c095a2bf97474b0"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
