class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.24.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.2/dot-agent-deck-darwin-arm64"
      sha256 "1c07ca5ea17bbe844e29d3ed26604a272d5183809da4be507d8bbe54fede419d"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.2/dot-agent-deck-darwin-amd64"
      sha256 "6ed68fc439cb6eb549449fc93c43f59ae281f65c1be951396fa44cd1a5f76dce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.2/dot-agent-deck-linux-arm64"
      sha256 "1cfed7875886b2601eee2240d56ef8dcee0302f9e3f924cc8259189e055de831"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.2/dot-agent-deck-linux-amd64"
      sha256 "0bbf1e36011b3729f4f6b032c7642bce579d6d3a107d6b84b26b2c29ac8c0a9f"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
