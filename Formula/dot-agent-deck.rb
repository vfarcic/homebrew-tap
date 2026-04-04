class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.0/dot-agent-deck-darwin-arm64"
      sha256 "e4ee1d25ab921ea4718de8d5ebc9005b810d4024c8d4988429e9efb03d8e6aa8"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.0/dot-agent-deck-darwin-amd64"
      sha256 "b1535be0a51a39e7f0a10615a838879480dd9fcaabfe3e45d2b259db500a998d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.0/dot-agent-deck-linux-arm64"
      sha256 "c14dc82174336c7c3ec468fd9d409c24dbf79bf550f1ba51909ce7f4eaf9b3d9"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.0/dot-agent-deck-linux-amd64"
      sha256 "3841326dc975d85eb127c709282075b527d8fad35895ce437cfa20d4ff73634d"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
