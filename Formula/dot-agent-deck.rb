class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.49.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.2/dot-agent-deck-darwin-arm64"
      sha256 "bfe6be2d588906770246a379361e3ccb73baecb3c40eb14650e769f6cd7be185"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.2/dot-agent-deck-darwin-amd64"
      sha256 "da777537c84336322520fa3514543da75ab799d6ad2f698d69dd15f0279b01dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.2/dot-agent-deck-linux-arm64"
      sha256 "7c40c342d24d6eac10b7ba4b8c7177d464fbe94ad00de0754da574f1dadda365"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.2/dot-agent-deck-collector-linux-arm64"
        sha256 "1ae8d4baffd38115aaf7042da08e8810e083a19bd9f4b0313410fc9874576d6d"
      end
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.2/dot-agent-deck-linux-amd64"
      sha256 "66b58a477901e58d1bcb9a4722d4eac5ea42d54917464fd6b29b61777b9fd126"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.2/dot-agent-deck-collector-linux-amd64"
        sha256 "641e48fa770070330e46d28c9b8b7fffbaf38c670e41fe6f604cbc1fde4f2994"
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
