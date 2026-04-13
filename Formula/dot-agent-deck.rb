class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.20.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.20.3/dot-agent-deck-darwin-arm64"
      sha256 "1e16d31051ead55e56001743db065b08b3489d05d227c19d9479b60d3ed50ab8"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.20.3/dot-agent-deck-darwin-amd64"
      sha256 "c375f273c57e15644b2f45106f533561e1eb0ada84b751997c70562a7ca0641a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.20.3/dot-agent-deck-linux-arm64"
      sha256 "918597666b408991b225525579009127ebcb7ab67b7297bd3ea9f99db2052718"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.20.3/dot-agent-deck-linux-amd64"
      sha256 "6885082857e02ecfcc0f39a1f5e8ae3175bd3f8d472f32127b453e41ee72b23b"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
