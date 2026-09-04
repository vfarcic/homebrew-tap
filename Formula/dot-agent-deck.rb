class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.39.3"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.3/dot-agent-deck-darwin-arm64"
      sha256 "49c7ef01836746d409b17d5b6e2f18e827069332b00f6699ced9c299383c2c3e"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.3/dot-agent-deck-darwin-amd64"
      sha256 "8eada5a978a31e13b1cb8d7ce69df3568f6c1df2c543d3e0f4629c72cbcdbace"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.3/dot-agent-deck-linux-arm64"
      sha256 "64a51daf3bd8914079d8a49b8c167f653fe7a75503f232d3903adb6557c64f95"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.3/dot-agent-deck-linux-amd64"
      sha256 "b4340a0ff5d64d2bc477abeab26cd98c05fb63b793b068a418c314c229ed39f7"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
