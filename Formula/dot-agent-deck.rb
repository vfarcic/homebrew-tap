class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.11.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.4/dot-agent-deck-darwin-arm64"
      sha256 "3491a0718021e499d81ac13ca01ecf062e9cbf64a12d9cc580d0714ea71a4b70"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.4/dot-agent-deck-darwin-amd64"
      sha256 "268c4e7398b9d184507c52d3af7e69fbdd50c1ef3014f30397ce2ca0cf0f1ac9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.4/dot-agent-deck-linux-arm64"
      sha256 "00a58151cdf73053eea11de03ff5c2bd619f51414e66e486210acee3f2807f09"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.4/dot-agent-deck-linux-amd64"
      sha256 "ce36d6b20d74e2a4cbbbd561f6f6e2c509fa3bf5f1313ef13170bc2ebea5c7a5"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
