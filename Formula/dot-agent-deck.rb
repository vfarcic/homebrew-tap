class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.25.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.25.0/dot-agent-deck-darwin-arm64"
      sha256 "730d82710b3cb6b0a7ea183ce098595fd5a5ff11f5fa9f54fa56532e55fed226"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.25.0/dot-agent-deck-darwin-amd64"
      sha256 "456a7551ee2641fda75454f775537757342a584f6756b91b3c4d12eee1c6563e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.25.0/dot-agent-deck-linux-arm64"
      sha256 "c9148ce451a17098ade11e723d81215e773252a01027e14ec59fa35ae1c404f5"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.25.0/dot-agent-deck-linux-amd64"
      sha256 "934e7f9db430328855f0cffeaab62c422aa26939630fafbac143d124578ffb99"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
