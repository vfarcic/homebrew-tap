class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.41.2"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.41.2/dot-agent-deck-darwin-arm64"
      sha256 "407c03f5faa9def624e27eb2ad48b2879da05ae2e58e1097a8e9432f71eacbac"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.41.2/dot-agent-deck-darwin-amd64"
      sha256 "2d6384ad3fb47fb8e6399dd8e1e76dc20818405a8e7a820d7eed1ba40d72f0ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.41.2/dot-agent-deck-linux-arm64"
      sha256 "9f74627ce3f39b35feca4526266fa70da4ae5691120813b517b3d64622b759ae"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.41.2/dot-agent-deck-linux-amd64"
      sha256 "63af4fb6ee64b08241fb8d9c85df4f36aea9751af8c74dacec84713aa18f21b5"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
