class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.24.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.5/dot-agent-deck-darwin-arm64"
      sha256 "b0e6512b8c9dccb195d94d2e9e09aece0d12b4b34a520135dad91376bfb65451"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.5/dot-agent-deck-darwin-amd64"
      sha256 "082e2f9da9350d45faee1d627d2903f26bf477ce1728c8535b3a46f8c171fc7f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.5/dot-agent-deck-linux-arm64"
      sha256 "d50a36e3d747f1e457fe0bf417d82c3bd6534b0703d909615489a0e2fdb5831f"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.5/dot-agent-deck-linux-amd64"
      sha256 "ce36508458417aeb5e2842c4a4778ae1c7de782759f788ebd8422d0b7f905024"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
