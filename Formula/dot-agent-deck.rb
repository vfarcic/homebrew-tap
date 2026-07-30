class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.35.1"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.1/dot-agent-deck-darwin-arm64"
      sha256 "1be3c0007a25fc74263e6469c192b9892cc2772a1ba676d01b9e106e7e031b80"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.1/dot-agent-deck-darwin-amd64"
      sha256 "982e44d34ead2450c8c55b88020ce745200a953e34bfec7ef330a5c61f8a9e28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.1/dot-agent-deck-linux-arm64"
      sha256 "9e354aaded45cd750c840a626e22bb481b3c01aa4fb255847c9d4016b254c840"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.1/dot-agent-deck-linux-amd64"
      sha256 "51fa3c81aba15089d588fee335e02e0ac8a3d58b38a9bf6b49be77e57cf9cf7f"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
