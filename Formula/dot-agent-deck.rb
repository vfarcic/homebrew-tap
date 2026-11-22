class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.51.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.2/dot-agent-deck-darwin-arm64"
      sha256 "6741af20f16946a672c9f2cfdd93c454616c3671026e6687137bf5d82cf1ed02"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.2/dot-agent-deck-darwin-amd64"
      sha256 "f7f5f68ed4037c2c1e2c3d251c7bae722734486eb5228bc5342787a8038ac716"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.2/dot-agent-deck-linux-arm64"
      sha256 "40310b00ca42df733d29cfcdf0673b78a5b5367d6cfc384e9ecce6a40844eb9f"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.2/dot-agent-deck-collector-linux-arm64"
        sha256 "d732491482e64635e3704118aa3f2246c26feaa406c1a04282504e5025bd90b9"
      end
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.2/dot-agent-deck-linux-amd64"
      sha256 "2dd7eb7e60fd7a162d12ac28ccf98d68b0d3caff07e9c8924e1d7a76467679f5"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.2/dot-agent-deck-collector-linux-amd64"
        sha256 "223cd17ebf5b59fbe303ca855f59ef8361b8d4d19e544a6c175a77ec7b8e2229"
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
