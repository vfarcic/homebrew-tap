class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.49.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.3/dot-agent-deck-darwin-arm64"
      sha256 "25f4f54c04c7b80d6c55252b755f2783f646d0ad0acb49f4d6d78c0a6cc4d919"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.3/dot-agent-deck-darwin-amd64"
      sha256 "ac0adfd0c28fe8c9bd15c2497a257ec9f48014ef89b734ad69f12648512ebde6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.3/dot-agent-deck-linux-arm64"
      sha256 "95d4e4c4e96142afe0af4000d0bfd8c3f5f7a25df7dd3fa566e3072e59e90543"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.3/dot-agent-deck-collector-linux-arm64"
        sha256 "f3530e3d9dd1fd47c246aad4520666bcbcd60394cdb0169e36944a3645767e81"
      end
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.3/dot-agent-deck-linux-amd64"
      sha256 "8f43002a2b9fd5a258ab407b9b074ca1474a7ba763144f5caa34786a46ad0bfb"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.3/dot-agent-deck-collector-linux-amd64"
        sha256 "d4dc9169e79e3ea2edcad50c71aadf2d64374af8aa5d3c2ac1d9f33346494f2d"
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
