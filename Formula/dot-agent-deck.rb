class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.51.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.1/dot-agent-deck-darwin-arm64"
      sha256 "4bba8600cd46626b5f610e1ff0afcca6116aac6a25d2759431d1fdbfb2625e8b"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.1/dot-agent-deck-darwin-amd64"
      sha256 "21da1e4f3e8b287157be159b7a243ab8e32d33199aeb6af64d07704131c4e10c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.1/dot-agent-deck-linux-arm64"
      sha256 "3da465746e4eb9c9f9df552844a80a057a4cd4cbb05f2570f40a01374fc21e2e"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.1/dot-agent-deck-collector-linux-arm64"
        sha256 "1114019d6ba9ba7262f9495808a3fceea4d05f576dd7e01a1e48ad1b100e0f03"
      end
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.1/dot-agent-deck-linux-amd64"
      sha256 "e8e3e65a1438d6fee94a20d1135af6277817165832f34eba16766500b196dfee"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.1/dot-agent-deck-collector-linux-amd64"
        sha256 "06369dedf89efa28fcec7afbfc536e7257fd61bf379ef0a7584f61c24dd1899f"
      end
    end
  end

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
    if OS.linux?
      resource("collector").stage do
        bin.install Dir["dot-agent-deck-collector-*"].first => "dot-agent-deck-collector"
      end
    end
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
    assert_match "dot-agent-deck-collector", shell_output("#{bin}/dot-agent-deck-collector --help") if OS.linux?
  end
end
