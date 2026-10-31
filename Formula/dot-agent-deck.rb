class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.49.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.4/dot-agent-deck-darwin-arm64"
      sha256 "7be1424d08ab7ed4f7eb35396a7a6e5456c1b414a95569ed3a014d36ef5d9b17"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.4/dot-agent-deck-darwin-amd64"
      sha256 "7f3986996f35a2b95690089626cfaef42db3ae3e0d61e779c2a6b0db5c26d695"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.4/dot-agent-deck-linux-arm64"
      sha256 "3f4ef21a6e29cddf0f363e1d420bdfeafb718632bd2f2173a48536dbd721a0cb"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.4/dot-agent-deck-collector-linux-arm64"
        sha256 "8400b49b0683f90cd71e144a5ff1b8e1f9dc0ad90b393f81678fe52367f70b9f"
      end
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.4/dot-agent-deck-linux-amd64"
      sha256 "d08b8915c5b7c78128d51881a62a0a3f2bead34bbd9cb6e324d499f50e909e56"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.4/dot-agent-deck-collector-linux-amd64"
        sha256 "f1ec93312bbc73c80967f07fffbba37c87092d4ed698882ab505282b2eae5dfa"
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
