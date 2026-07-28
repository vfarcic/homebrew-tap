class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.35.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.0/dot-agent-deck-darwin-arm64"
      sha256 "fccaf710e2c399334e5cdb92addf339d9a01ab14b8297c943694dda3a42010c8"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.0/dot-agent-deck-darwin-amd64"
      sha256 "0fc7070ca7e0ae24f97fdc38fd6a610e0542fea761f654c4477ae2a64d031a5f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.0/dot-agent-deck-linux-arm64"
      sha256 "28bf1777b4debe3812ff4f8d5f7a1e4e29a0b3e864970f3f953b00408887eec1"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.0/dot-agent-deck-linux-amd64"
      sha256 "515baf9c3af7a8eed7fe57cc191cfc55450919cba0812870d56add3dc1e3a94b"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
