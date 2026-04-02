class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.12.1/dot-agent-deck-darwin-arm64"
      sha256 "0653b998febe4f82078c80e86aab4acbdc0fbeb6f23753823c8f2860574986e3"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.12.1/dot-agent-deck-darwin-amd64"
      sha256 "843fe23b442654a0d0e6f09356e57bb365041e6de689670445aeccf923aafabe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.12.1/dot-agent-deck-linux-arm64"
      sha256 "e35d0ed2c274cdd7da423f9b82278190a570d6f0e2ca45d97b06fac830afdc1c"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.12.1/dot-agent-deck-linux-amd64"
      sha256 "128a093ad07491f6cb38209ddbd0472800f937c6a163e442b86b3edaa5e92c03"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
