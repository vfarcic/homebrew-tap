class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.20.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.20.0/dot-agent-deck-darwin-arm64"
      sha256 "a0eed2f49c7e8ce32aa47f96909fe0f3f55c5709b31464901d0cf76131c50f90"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.20.0/dot-agent-deck-darwin-amd64"
      sha256 "4e27868bf13a36d4280c24f663866ccbb458cc69cbf322a7a85c3e16fd773507"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.20.0/dot-agent-deck-linux-arm64"
      sha256 "0ac328efb83e3a623e18eb545f3aa7ae97e8d8b64916916b9a9cd8c862eae3b1"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.20.0/dot-agent-deck-linux-amd64"
      sha256 "c324dcfff14baaa1f43eed428eb23ae024fd1b2005a6fdeca8970612232d541c"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
