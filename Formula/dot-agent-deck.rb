class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.50.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.50.1/dot-agent-deck-darwin-arm64"
      sha256 "31bb106689fae38df12423faa4397ab3ae7c45958dbf4cde0ac675ef260c5d7c"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.50.1/dot-agent-deck-darwin-amd64"
      sha256 "9c8f0c4c5dd49da0fc3cc221f043f75c3c3c9c52862412ef1a82176c09620d98"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.50.1/dot-agent-deck-linux-arm64"
      sha256 "056d2043a454fb97cae50c7590ad542adaa22f0a9f12efe09065a8cb90de0ba6"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.50.1/dot-agent-deck-collector-linux-arm64"
        sha256 "3c2a615f4e5875dc27696f1c5d32dac3aa620a2d7d26a2f21a7d18b99561db06"
      end
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.50.1/dot-agent-deck-linux-amd64"
      sha256 "95c4d2a69522d7e216bd406f3fbc20a25d1e73e1e5a3dfcb27172da1746cca76"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.50.1/dot-agent-deck-collector-linux-amd64"
        sha256 "7bc4a8be0dc09bfeeeca161575c5da067d93e68dd1c3c19803ebfff3fd76a769"
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
