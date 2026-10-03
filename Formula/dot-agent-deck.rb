class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.45.1"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.45.1/dot-agent-deck-darwin-arm64"
      sha256 "acf45dde5f501f7d03d3ed839080930c51637b98737e82d316214973ebfb2649"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.45.1/dot-agent-deck-darwin-amd64"
      sha256 "e58de1494b43414c7eda8e1bd424fc6f9925c15b1aecdd141d129d6539ac7858"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.45.1/dot-agent-deck-linux-arm64"
      sha256 "f5a20c63affc3a80181811a16db360412e1819a168a39f660f7002c34c2c7f3a"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.45.1/dot-agent-deck-linux-amd64"
      sha256 "c78d8ff666c89e111b167a90243d1d0cdd1dcb2c55d5c466cc7e78530c17da83"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
