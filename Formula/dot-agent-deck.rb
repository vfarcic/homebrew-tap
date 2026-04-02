class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.11.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.5/dot-agent-deck-darwin-arm64"
      sha256 "108a3c402e65477b89b85a99d9deb552cae32e34b666272701049b29f11767dd"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.5/dot-agent-deck-darwin-amd64"
      sha256 "10121493b46a23839d0355017cb04d5aa1ef6e18d4dbcb39ccd32bfb6493cda1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.5/dot-agent-deck-linux-arm64"
      sha256 "0c35ac6dccab0746d82284510555560a5d2ec371f8258d405b5792889e8fd73c"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.5/dot-agent-deck-linux-amd64"
      sha256 "c7e815100d9c2073998c03eb5496a3765846e96f5f33467fff3d1978252dba71"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
