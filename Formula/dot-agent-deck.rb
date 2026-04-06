class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.17.0/dot-agent-deck-darwin-arm64"
      sha256 "bc44da1db6d7f1b34cdc69aef37ecb780491c5b8b02371b7e3724298f7941a71"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.17.0/dot-agent-deck-darwin-amd64"
      sha256 "2ff5f60fadbc816d9837079bab207cdc6e9bcf255d152c76c2c9c3373d22250a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.17.0/dot-agent-deck-linux-arm64"
      sha256 "a7bc13cdda8a87b2e7b2d3da3bc8daac1649455ac0844af966ccf14238474302"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.17.0/dot-agent-deck-linux-amd64"
      sha256 "3d42f69e653954def22cb72c19d35ea25c2e4cbe520113a1249630a665ace6a2"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
