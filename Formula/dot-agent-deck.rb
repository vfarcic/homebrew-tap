class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.27.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.27.0/dot-agent-deck-darwin-arm64"
      sha256 "43399fafeaafb753f56286a6927570c04c0e481c2f1e9654c9399902ad74e38c"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.27.0/dot-agent-deck-darwin-amd64"
      sha256 "b208b8279287700d079dd992760260190eeae211972501922e23dcbddb951340"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.27.0/dot-agent-deck-linux-arm64"
      sha256 "728f0b670ae61b632f35fb5bf9363fc387a16e89d33b93d2ee48da9412f3bbd8"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.27.0/dot-agent-deck-linux-amd64"
      sha256 "1467534e2177f40d9d23ddd2af4e32596f1bf2ac60daa6ac1673db5f080ffe0a"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
