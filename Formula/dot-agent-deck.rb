class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.45.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.45.0/dot-agent-deck-darwin-arm64"
      sha256 "8e98db8e49cfcf068275a45c89c67b42cc5aac34e7f2e71459c7b621d975857a"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.45.0/dot-agent-deck-darwin-amd64"
      sha256 "4afb493b6a427bba4834522037a58b09d485a3ab6ab31c145277101e9dab0f60"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.45.0/dot-agent-deck-linux-arm64"
      sha256 "8ec2131f5f629b798cc5da56415bce76170a361ee288d5c7e6aedccfa0d94692"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.45.0/dot-agent-deck-linux-amd64"
      sha256 "a26f943e6dda0f82bba74f7d74d34c1825b9d728557cc4961c80f1ec31a96a05"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
