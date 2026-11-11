class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.49.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.8/dot-agent-deck-darwin-arm64"
      sha256 "be6990a75488270812951de9fa0720a80a85aa2bec2ee8b1687e1844302a1e0c"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.8/dot-agent-deck-darwin-amd64"
      sha256 "cd0270cec41aec78adf883c1bd5a5e50f68cf6339ec4f77978e060a24d26deef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.8/dot-agent-deck-linux-arm64"
      sha256 "42eca513d53b453632856cc442a9eaa1f9a9276971c8b04edff053eda8194668"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.8/dot-agent-deck-collector-linux-arm64"
        sha256 "917ec8aae553b8d911c4eae74763835a31ff9be40c14116f1b35dc6b70386108"
      end
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.8/dot-agent-deck-linux-amd64"
      sha256 "e3cedd2759b6fe09e6963a9c76eb6599b17ef4a86dd0888d2457ab9f227bdceb"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.8/dot-agent-deck-collector-linux-amd64"
        sha256 "53d4dfe5c7d8c4d7775813d872d0be6896497f8ca33b9a25f64814470bae1634"
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
