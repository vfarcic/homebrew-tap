class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.22.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.22.1/dot-agent-deck-darwin-arm64"
      sha256 "ad20b40786d044e081bc27175c2cbf4cd54ba05b522c29cc89cdd39bff959384"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.22.1/dot-agent-deck-darwin-amd64"
      sha256 "bd72dafd347960b24546a5665400f28d75cf35754b373b4d78a56c4b7bbe51ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.22.1/dot-agent-deck-linux-arm64"
      sha256 "bf4d62fce7e6c8ed0acdc480ffcf2b68af09c8c4f230ec820a0c961941e6a4ea"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.22.1/dot-agent-deck-linux-amd64"
      sha256 "3acb4d1334c9b105e419f4976717c1ca5d7ae38f5cac1e6b9b9ebe672bc7b1e8"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
