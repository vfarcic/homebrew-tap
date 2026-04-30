class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.24.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.3/dot-agent-deck-darwin-arm64"
      sha256 "29da33bcb81261eed7806b96cff40dbcc7fe5ae6d5f9a0e87baf02b73a45c45c"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.3/dot-agent-deck-darwin-amd64"
      sha256 "655c7cb074477286de88e49eaf971a9ac046b23e68a1cf1d3e9db0924c177c1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.3/dot-agent-deck-linux-arm64"
      sha256 "7183e1d6e9e92cba9b4ffd4da90505749b4425b97fcb5331a33f19a7b1c359d0"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.3/dot-agent-deck-linux-amd64"
      sha256 "2b2f42f624245335d131d088a414aa7809ab2d090bb17a2709ac83b63222cdf6"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
