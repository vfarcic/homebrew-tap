class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.48.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.48.0/dot-agent-deck-darwin-arm64"
      sha256 "0a542d0b35e358f328b495b1dece26e25ae2d04bdf6de4c419caa90d47f937bc"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.48.0/dot-agent-deck-darwin-amd64"
      sha256 "078a4bd2acdb5f1ca3f9649f30af2fa8e955feda9c93a3e4cbedb9cb3fe9781b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.48.0/dot-agent-deck-linux-arm64"
      sha256 "90bcb51e533c36db4032f9ab82a5b82e5bf09439633f5a6ae97c15fcdced79d9"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.48.0/dot-agent-deck-linux-amd64"
      sha256 "b077ca85adb88691a03574212f4ad6015895f8de3542576d4c9909571e00ed10"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
