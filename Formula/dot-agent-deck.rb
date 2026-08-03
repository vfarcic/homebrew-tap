class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.35.5"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.5/dot-agent-deck-darwin-arm64"
      sha256 "e4186f651ba4d81c92512c1e4eca54aa4475014f7d91eb0653056f975a7cd480"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.5/dot-agent-deck-darwin-amd64"
      sha256 "0550364148340c1fdc69f610c58fc61ebf7ad771932f09104a543d71853a105d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.5/dot-agent-deck-linux-arm64"
      sha256 "6e72b0f5eff2734f0d754bef0c9cb6190519b23eaa61840e564677f0c4c8ba64"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.5/dot-agent-deck-linux-amd64"
      sha256 "b4ee79e12b05f81966b61b3ba53a6b94320ac3347826669ba51e917e079dcc48"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
