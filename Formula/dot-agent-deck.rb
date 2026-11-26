class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.51.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.4/dot-agent-deck-darwin-arm64"
      sha256 "836710770ed22c8b8f1d2af889141760e61bdbac080b32ff9b9e164c461f2df9"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.4/dot-agent-deck-darwin-amd64"
      sha256 "906692611ffdc97fee3ab583354a3490dccb24b3107b72a9256ad3cc7fce43eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.4/dot-agent-deck-linux-arm64"
      sha256 "6785106842226f2253db07a3d5eb21730438dc1c6d5d0a1f196872c4ae500e2a"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.4/dot-agent-deck-collector-linux-arm64"
        sha256 "5025262062952a816fb865d2a67b715639da302d610c22d6c147cf62698f9ae3"
      end
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.4/dot-agent-deck-linux-amd64"
      sha256 "f7aab409e5f075a89881b89dc9eddd64aa07475da0847786bd9f37503411e543"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.4/dot-agent-deck-collector-linux-amd64"
        sha256 "2e4add58d102916de3dfedc2d6571e3ccc14fee1e13daab0f0fe6cbce09de069"
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
