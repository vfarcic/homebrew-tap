class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.12.0/dot-agent-deck-darwin-arm64"
      sha256 "9048ba89828cac4a0e25d6d071f50ee746942d4599eeb1e99a3381d568394fee"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.12.0/dot-agent-deck-darwin-amd64"
      sha256 "d65a8355c605721608c6b24bae62e0df63224caab694fd430f04b4fe5963eddc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.12.0/dot-agent-deck-linux-arm64"
      sha256 "348c2be01c8613959a5eebd1d565d15cce524885dc31618cdd4b9b7846106fdf"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.12.0/dot-agent-deck-linux-amd64"
      sha256 "7834d2306a824d49fd57638e0d6c2ba07bf39086c7a65a18258436c966b1ae25"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
