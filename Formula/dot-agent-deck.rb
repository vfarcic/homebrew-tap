class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.49.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.1/dot-agent-deck-darwin-arm64"
      sha256 "c71b0010e3e41514ab91cf34bceed80e379a88dd06ae43709f6b62956ace063d"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.1/dot-agent-deck-darwin-amd64"
      sha256 "aa8e032a497fd6e8435601da04994e25152bdfa35ce3cce1af092e8aa789ffcd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.1/dot-agent-deck-linux-arm64"
      sha256 "5e046de0dbf4e475a2bef5fa3cc19e4a12bcaefeeddf4f03bd0cab50f4ef164d"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.1/dot-agent-deck-collector-linux-arm64"
        sha256 "3f3ea7d8951e81a050e50534c8322c572e935f2ba509660f24887702042e1a99"
      end
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.1/dot-agent-deck-linux-amd64"
      sha256 "59699ef291629c256a1aa608c4e709f9836f1e07b8764d47dbeeb7c46428cfa9"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.1/dot-agent-deck-collector-linux-amd64"
        sha256 "87941b5769199761b483852fe9ad0e8bacc1879ddb955d8f6ba0e7c543a2554f"
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
