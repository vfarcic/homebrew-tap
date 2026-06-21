class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.31.2"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.31.2/dot-agent-deck-darwin-arm64"
      sha256 "be3d93552d2e87f9afeced32fcf11b673edef694b8ed878197f5e48418bddbb5"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.31.2/dot-agent-deck-darwin-amd64"
      sha256 "002653534b99290d4ca703d55f928a235a0a67a307f3b8492412383ee978eb14"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.31.2/dot-agent-deck-linux-arm64"
      sha256 "a6d8e6a379c4816f31175ab990cf40909b889689ea3362dbb1c2d9db2e35a3a4"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.31.2/dot-agent-deck-linux-amd64"
      sha256 "fc878d11de25d319eb0af2f46f7f0aab0b7c712354e8402832b85349256f61c4"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
