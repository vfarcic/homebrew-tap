class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.14.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.4/dot-agent-deck-darwin-arm64"
      sha256 "f4a41a0c759a297721efcd1da4f91596882aba394865ac630f6fc5fab72d504b"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.4/dot-agent-deck-darwin-amd64"
      sha256 "5a96a38af9d7d55602fb51ad4ea1655d099d40a942b56dab62c423a07ba9ba4e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.4/dot-agent-deck-linux-arm64"
      sha256 "2448a62eb7cacf46bc7fc2403f41c401ca19e4a44cb80745df9d433b2ff9f810"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.4/dot-agent-deck-linux-amd64"
      sha256 "3f554ec3c330ca41c8d1fd00fe73fce8c0e72cc9e4357a581b60c5aedda183c4"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
