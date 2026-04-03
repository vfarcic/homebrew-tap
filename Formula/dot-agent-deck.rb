class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.13.0/dot-agent-deck-darwin-arm64"
      sha256 "e5344ebaadc1b687eefb2f8ab2270ba7b28a95f008181e7bf0e3e5686f94b55b"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.13.0/dot-agent-deck-darwin-amd64"
      sha256 "5c5fd03d4ae7087dc042b0f274db9814caee39364150aef71144d6f6790b75aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.13.0/dot-agent-deck-linux-arm64"
      sha256 "31e01a96df74895d4346c3ff8e82f68d45f81fd796dd822aa622543c5f8b819c"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.13.0/dot-agent-deck-linux-amd64"
      sha256 "6b431075270edd192d804e6725ab28c281e40e8bc01359f2c0d64ae74e501b3b"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
