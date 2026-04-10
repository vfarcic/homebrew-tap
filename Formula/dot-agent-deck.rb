class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.18.0/dot-agent-deck-darwin-arm64"
      sha256 "a20b1446a77488fac730e9e03ed6a4e99020fc666fdaf0b59bd0348ba1669fd9"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.18.0/dot-agent-deck-darwin-amd64"
      sha256 "7ef91e0e492594047b0f1cce6d8f9fe305e46ce3fdbade0ee7ac943f692017c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.18.0/dot-agent-deck-linux-arm64"
      sha256 "57e2447072745a0bfe8a4653ba12fdcbae8597e67236dcfb47a37336c159de5d"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.18.0/dot-agent-deck-linux-amd64"
      sha256 "ee4187a92262647acf61fb4c8b4b0e4aba4ffeedfd9f0785e2b38e5cd64fdbe2"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
