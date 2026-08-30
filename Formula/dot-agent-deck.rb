class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.39.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.0/dot-agent-deck-darwin-arm64"
      sha256 "a42906692ee24de74a6b556c0247ac17825af217c751622079b9adb9f59b971a"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.0/dot-agent-deck-darwin-amd64"
      sha256 "1aa9f47a8ca36f96683a6d9bde5a4abeff75c61bbaaa1854d8190961753cd820"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.0/dot-agent-deck-linux-arm64"
      sha256 "6aa8a35082edcff930cc7779c6ecc481e738baf737b25389d5bbbeabd31b968d"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.0/dot-agent-deck-linux-amd64"
      sha256 "a75efa6858367b450dc69e3de9d543120782c1d36ccba0a2c7d86a8585ad746e"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
