class DotAgentDeckBeta < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.25.0-alpha.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.25.0-alpha.0/dot-agent-deck-darwin-arm64"
      sha256 "091ee285f9cc999c8d2ab570070a977a22b96dfeac070e4402a81e3f175d5614"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.25.0-alpha.0/dot-agent-deck-darwin-amd64"
      sha256 "0ccee36751e1f3b88aef16a5d8b910ddabbed2dd516c23df3b5e4579314d077e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.25.0-alpha.0/dot-agent-deck-linux-arm64"
      sha256 "3fd1f1f8538f3507311c4173a91a99fb3251468f2d361fb50f9eebe8fa9a9572"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.25.0-alpha.0/dot-agent-deck-linux-amd64"
      sha256 "e7128d09786d43c07db62e4d244b25ec14c4bdce8852ea8d4e9fd2b3340f39dc"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck-beta"
  end

  test do
    assert_match "dot-agent-deck-beta", shell_output("#{bin}/dot-agent-deck-beta --help")
  end
end
