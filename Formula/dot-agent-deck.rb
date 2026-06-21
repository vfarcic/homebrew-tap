class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.31.1"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.31.1/dot-agent-deck-darwin-arm64"
      sha256 "d6e7ecc25708fe7c2a6588d70f8b18a4fd196388e74437c3ccc0756fc6423356"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.31.1/dot-agent-deck-darwin-amd64"
      sha256 "617e17ee106fd4e7df2d299f8968efca7cb6972a01dc2333a55f3be48dbec257"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.31.1/dot-agent-deck-linux-arm64"
      sha256 "7b89e16f1c0b214cb92b588ca1ff2c6ddc31b45cfe104c986f6fef2cbdc533e5"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.31.1/dot-agent-deck-linux-amd64"
      sha256 "7f95967f5b00db6168c633942864b608c4e411cb23d2725f9ad3613605c1d41a"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
