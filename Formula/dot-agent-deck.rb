class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.11.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.2/dot-agent-deck-darwin-arm64"
      sha256 "51d6d6d12055f37a45a4ffad5bce9be4a5cce39cd657ad1b899e974452cdc41d"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.2/dot-agent-deck-darwin-amd64"
      sha256 "ee6be72ef90c7a00fe33779129cb50a4f19745f11253407450faff19f5bf1b4e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.2/dot-agent-deck-linux-arm64"
      sha256 "b1e225e06acbba25d33ed8b2f460782eee1ea498acfe22faf16b30c6ff56dba1"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.2/dot-agent-deck-linux-amd64"
      sha256 "d06e6bc4791f30e1c6cc0c9a50db0373d2b56b1e60ac6c687a214f8a5cb690b7"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
