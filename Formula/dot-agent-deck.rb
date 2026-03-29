class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.2.0/dot-agent-deck-darwin-arm64"
      sha256 "d1408f068462c43f48954d3e2d6dbde6b6663b403b435e851cd0f6585c973344"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.2.0/dot-agent-deck-darwin-amd64"
      sha256 "8ab42e255733696ac0dffaddbec8195968cb3dec82adbf27c35ee7edaf2dccb0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.2.0/dot-agent-deck-linux-arm64"
      sha256 "f6e2e7407efbad5a7ce4e636167b31fd2c8cd537f62ecf22422e1e097a0e7a76"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.2.0/dot-agent-deck-linux-amd64"
      sha256 "c43cab00066b741e8797bda523399acce49053255e9ae656ee645676517dc321"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
