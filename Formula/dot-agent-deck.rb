class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.50.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.50.2/dot-agent-deck-darwin-arm64"
      sha256 "570a7a14fa2c2f61579070ad9ba690b6e777acca6f312c155e2c822c0364e1bc"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.50.2/dot-agent-deck-darwin-amd64"
      sha256 "e20d3c022ec4b9d5ee8827c74abb907e4d825fbbfc8e46d1183bcc42eb1b6fd5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.50.2/dot-agent-deck-linux-arm64"
      sha256 "85f41ed4ddb370839a9e9566f5f6ffff645b5662b197b16d76006a879b560bdc"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.50.2/dot-agent-deck-collector-linux-arm64"
        sha256 "97a2d1ef0c29c0f0d14f079ae472bfc22a4b641558f11c97a0685b1dc6bcca01"
      end
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.50.2/dot-agent-deck-linux-amd64"
      sha256 "eafd30194e303c05a18fab9c51476147962f87279b3698915ae8d35e27b8e983"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.50.2/dot-agent-deck-collector-linux-amd64"
        sha256 "e1b7f070435037cca0a2e8bfb7354dea3e1eee2bdd18531810f0c67b0c6bd6da"
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
