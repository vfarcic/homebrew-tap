class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.51.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.5/dot-agent-deck-darwin-arm64"
      sha256 "95988a0b088a7158dede654ca9335b06e8383f7077cfdf4fbd42c6d3c3541fdf"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.5/dot-agent-deck-darwin-amd64"
      sha256 "efbf5347f9b49e29efea607af3ff40efd5c7a88d62291f4b4217c0cbad19943f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.5/dot-agent-deck-linux-arm64"
      sha256 "b3e321966f48de55ee21a85191c23eab2b4ec07efa8f5b51f3a2ce4efd7f5005"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.5/dot-agent-deck-collector-linux-arm64"
        sha256 "b12df4db1d891461dc342d37aa193ab744a1159d6b42d0c8804ad331b2db6d58"
      end
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.5/dot-agent-deck-linux-amd64"
      sha256 "f3bd63dcd52dcf7f7e078de2b28340d19a5532d1e4c2d32b6c66bba642a57c4b"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.5/dot-agent-deck-collector-linux-amd64"
        sha256 "099d5fa0221a77aa210ace8c662acde05cde8c1ee260ec3605ad64a4d6be6463"
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
