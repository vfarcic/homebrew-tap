class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.32.1"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.32.1/dot-agent-deck-darwin-arm64"
      sha256 "695d0d302025808a0bb5ddc30ffad12b1e4f35d828f0f950206a4ad8958d2883"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.32.1/dot-agent-deck-darwin-amd64"
      sha256 "d58b0234857181739838ff93e1a7aee06ede77d5b8817223576a17153bfd2f7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.32.1/dot-agent-deck-linux-arm64"
      sha256 "5b976673501581e3aaa1f3833217653aeb8e8b698952f8e8be50825827ad7d93"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.32.1/dot-agent-deck-linux-amd64"
      sha256 "ddf039f72ba31ff92771cade1c15227200f113b6c780097cbe5e69adad755073"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
