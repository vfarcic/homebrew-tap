class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.19.0/dot-agent-deck-darwin-arm64"
      sha256 "29303539beef4afc3a5390137afddb21737903861145a0fda828adfd4faad8ed"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.19.0/dot-agent-deck-darwin-amd64"
      sha256 "9d6c533fc23cd6e690a24dd2faa49656f014278569955f67cb1aea6e76f91326"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.19.0/dot-agent-deck-linux-arm64"
      sha256 "475db30443ad2f26a91d4e9ea03499a9af22e6f23c371ccabc67aad9307f82a5"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.19.0/dot-agent-deck-linux-amd64"
      sha256 "a742eb9c4a0b78f627e5c094fc108c9b9b88db69e97e1d64c0f32510865dccd6"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
