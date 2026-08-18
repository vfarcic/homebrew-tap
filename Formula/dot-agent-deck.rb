class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.36.2"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.36.2/dot-agent-deck-darwin-arm64"
      sha256 "f0578f5d3207732c5aee7cdfd3af4a0c7641a4ed6c4c99648ddd6287ce522217"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.36.2/dot-agent-deck-darwin-amd64"
      sha256 "7e91f54385665d09a4aeb2c6a07221582d0ec2fa60c2972c87065392da4450e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.36.2/dot-agent-deck-linux-arm64"
      sha256 "e481e0443ca5e7632dcfe61448b220eabb55d4a80d7478afacc397a2bce0500c"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.36.2/dot-agent-deck-linux-amd64"
      sha256 "e949e8d29bdc852c0a22f85b3d615e4f61e19ad5cd69218a9f270f088d592f54"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
