class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.8.0/dot-agent-deck-darwin-arm64"
      sha256 "d3cade82c0867f6ec40e3111414a217573a8ba0f097aa2e081be9012e41b4a02"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.8.0/dot-agent-deck-darwin-amd64"
      sha256 "6fa36782d881e5a19ac3872577efb59a0390ef6b5d38e45f98a4726ce345f67a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.8.0/dot-agent-deck-linux-arm64"
      sha256 "6f0023aa62c1de686d7a0748bf58819e89c4e82fc02b44808e083649ba47ec16"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.8.0/dot-agent-deck-linux-amd64"
      sha256 "b1bad06e9b4affa6863b0854da5191aa80e8519b5edf8d4ecbbfc1299af2e2ff"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
