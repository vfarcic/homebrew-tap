class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.47.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.47.0/dot-agent-deck-darwin-arm64"
      sha256 "fbd97ac3e68a7bb668933ea2abeedf307c28dc6dfa096c5d57a323fa0d6099ce"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.47.0/dot-agent-deck-darwin-amd64"
      sha256 "26e75059746b56e7102cb782211c100f08ba3a69835eae3909274fea14fb3800"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.47.0/dot-agent-deck-linux-arm64"
      sha256 "d8a0c6fbeb9a4a63f1ba46572af2cc2afe64cf9ccb6dd95d9395cf0cddbfa81e"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.47.0/dot-agent-deck-linux-amd64"
      sha256 "8f6e4986532fc1575e2f869f843e5ddc47f037113d7d8a07514195143e28941c"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
