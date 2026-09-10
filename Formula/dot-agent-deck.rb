class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.39.4"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.4/dot-agent-deck-darwin-arm64"
      sha256 "a883f7bf442121cab5e688757cbb0ec02a2f8ac43abe2e72cf8c4006d3a9726b"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.4/dot-agent-deck-darwin-amd64"
      sha256 "d1c053dbb36e572a1c965b2c46af312d3086d5acbc37feaed2ee4511d5190cce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.4/dot-agent-deck-linux-arm64"
      sha256 "6a6504f71d296ab1df26163c0e0c44c29d3b75924be6b98c1b6a3c6def4fdb3c"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.4/dot-agent-deck-linux-amd64"
      sha256 "c47fb9d06a99153d7c0273777399cf62a21234f1a4084e1526b0c01ed168eabf"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
