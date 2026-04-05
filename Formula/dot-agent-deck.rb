class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.14.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.3/dot-agent-deck-darwin-arm64"
      sha256 "d953989b4069e864820a70b50d5cb6217fc56159a00b117c5f340eb07d20f587"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.3/dot-agent-deck-darwin-amd64"
      sha256 "3cea01b23dd3ab54fd389ab6b408b6217225d292e424474045491eb1c6c4c3aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.3/dot-agent-deck-linux-arm64"
      sha256 "ddc60345bf7e8c5d2d71a54d5fd16c619eb98808f2dda1d6dab385c647389320"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.3/dot-agent-deck-linux-amd64"
      sha256 "de5633caf2b98b622367f25b51893454751a296554be436225d2d6ea3bc4378f"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
