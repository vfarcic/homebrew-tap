class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.36.1"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.36.1/dot-agent-deck-darwin-arm64"
      sha256 "d51b1954d7d3a13f109816c503370616563e3d009448560c653b6ea4a0d4586d"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.36.1/dot-agent-deck-darwin-amd64"
      sha256 "f63996bccef6dc68c7ee97e124b9798d4294bbb9efa6fef09cb7124780cd2c22"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.36.1/dot-agent-deck-linux-arm64"
      sha256 "5cabbe35f1f161c3a8423786a17c03b0cb6b24599eb4a5c124ea47e98fc418b3"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.36.1/dot-agent-deck-linux-amd64"
      sha256 "84423382b6d88f2ec565a2e2721c84093d7795136ebd44b8021d161ec067939d"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
