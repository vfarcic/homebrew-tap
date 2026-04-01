class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.11.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.1/dot-agent-deck-darwin-arm64"
      sha256 "2e614956b17f12919189c488ff2a8c7f58c565d8e663e851c6a0a0b9686be3da"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.1/dot-agent-deck-darwin-amd64"
      sha256 "4902fad4f29d7070f7e45cd34c89c802d210988f8ea3306f9927c5ef2605f490"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.1/dot-agent-deck-linux-arm64"
      sha256 "aa57fc72a907f8e2b362a8a67bc00c84a68d5872d30faa9a8290c81412fc3964"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.1/dot-agent-deck-linux-amd64"
      sha256 "76e1c63580a9a4db6c42fa30339f57e70ab838425a76ea402419279285e4ad4f"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
