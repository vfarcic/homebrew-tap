class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.48.1"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.48.1/dot-agent-deck-darwin-arm64"
      sha256 "8a49320bdc28e633fd3c5578ae1cd7ae382e23a849ce4827dd06f698da91ae59"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.48.1/dot-agent-deck-darwin-amd64"
      sha256 "8bcf63f2abcb1dbec9915c87efcb8c4a278da32419b44af216136207cca14694"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.48.1/dot-agent-deck-linux-arm64"
      sha256 "9f8a17af383be3427c4ab079c3fe91953b6dee131253d149ec656505dfa8b78a"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.48.1/dot-agent-deck-linux-amd64"
      sha256 "cfa236caa931c159b3537f569055c82130f48579ab080f5be5be85fd7d9dcac7"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
