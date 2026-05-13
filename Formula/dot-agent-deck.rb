class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.24.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.7/dot-agent-deck-darwin-arm64"
      sha256 "71e6f2413a126bb63438b0631b01b6303867c540f2d385396de12f7479554b99"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.7/dot-agent-deck-darwin-amd64"
      sha256 "c227f33f5255797b9e78d2751cb77b6b648f4ca1bab5276b17fe8766c5aaa11e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.7/dot-agent-deck-linux-arm64"
      sha256 "84da08db9fddfd1957dc3e5d169c7d67ecc3ce42e46a3cd82244621c143dded6"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.7/dot-agent-deck-linux-amd64"
      sha256 "1dfa9aeef74e75f2d78ed408519952a915272f3a47bef0129e128c5451307eb2"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
