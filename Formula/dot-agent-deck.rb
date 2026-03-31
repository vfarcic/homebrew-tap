class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.4.0/dot-agent-deck-darwin-arm64"
      sha256 "a6340c11ee16d5942a5e888207b3096fba9c2d715fc281676561f2a965616a02"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.4.0/dot-agent-deck-darwin-amd64"
      sha256 "7a2f9a6130d451393565adf2f5509f4a803900f9deb7b7c356469cce41845d68"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.4.0/dot-agent-deck-linux-arm64"
      sha256 "cf79d3f576b19b71213a2a7a75b3454b9385448386c0b916527cd1cf259e7371"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.4.0/dot-agent-deck-linux-amd64"
      sha256 "89c862e558e440cd48a869a39a8579c985be294d69e24c8c5de41c856efdd7ff"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
