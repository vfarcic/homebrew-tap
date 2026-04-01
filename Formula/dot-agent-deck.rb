class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.9.0/dot-agent-deck-darwin-arm64"
      sha256 "51ad783b20d7f1c23e60583817d28b402c55b085544bf105ff95e87cddfc49e0"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.9.0/dot-agent-deck-darwin-amd64"
      sha256 "396f61c8b4498e5902d21b74a33ece26c3840b498a2e22ae97d409019a1b1771"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.9.0/dot-agent-deck-linux-arm64"
      sha256 "ed747a4ac4a3cfd05c075eb90b389c0f0a933784f9d418d3e74eb581d4199aec"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.9.0/dot-agent-deck-linux-amd64"
      sha256 "0f758baee6de8be7422a8877f3eb91a85dfc0be392bfc4dd7b0eecab1836f438"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
