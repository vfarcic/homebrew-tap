class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.34.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.34.0/dot-agent-deck-darwin-arm64"
      sha256 "d6ea68f48298e978910cf581acbc1cd2313d06d75750a5c6b1efd667be478702"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.34.0/dot-agent-deck-darwin-amd64"
      sha256 "2e5b5b2e44e3b09527e52a2d590ebe93676a771e0e306a8d6c695c6bf5fb262a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.34.0/dot-agent-deck-linux-arm64"
      sha256 "0dc7c37d04a80ade65358d955f168c37a6c43efb8de8d4d5e3de71befcf02759"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.34.0/dot-agent-deck-linux-amd64"
      sha256 "d7bfe2dfb9d23a89c8194106d7f0aa685453d7f58cebc9eeb386509bd623fedd"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
