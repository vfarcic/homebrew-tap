class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.0/dot-agent-deck-darwin-arm64"
      sha256 "44300b814bd3293822fe11b1a56ee45e08ac6f7110c3f178661142271cb26918"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.0/dot-agent-deck-darwin-amd64"
      sha256 "c24f8052e0691973b577aebd50ed75bda63ca8ab4989f9cc2d60f493fff18795"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.0/dot-agent-deck-linux-arm64"
      sha256 "273d9b7c761d384c1738f856e16bdd58ca858972d4de35ea3b63f85128d3202f"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.0/dot-agent-deck-linux-amd64"
      sha256 "9a3742477f0db2c0d2953bce28b8b71414d5a3f2a3af543e61a6dfc753ad763f"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
