class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.22.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.22.0/dot-agent-deck-darwin-arm64"
      sha256 "0ebc447ba2d13d4796b9616f354b13bb2ead4540552497d5442c4b44a9638df8"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.22.0/dot-agent-deck-darwin-amd64"
      sha256 "7b9bdbcf9d0e02199ee1485e8dcaec21e6c7f6a74e0b103fdd666f08680629e7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.22.0/dot-agent-deck-linux-arm64"
      sha256 "1158b75ffde282adfd278afa5ab354c53b96d0e484a7fc5d728c7b2fd3f3ded9"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.22.0/dot-agent-deck-linux-amd64"
      sha256 "7f6559116e435e73c9d8887188a3d7661e3d9458372729c5e934a2dc89b68985"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
