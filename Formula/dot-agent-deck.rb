class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.35.7"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.7/dot-agent-deck-darwin-arm64"
      sha256 "8e00d19db845178633a916b3a4d35d0554cf647134c55fd73195a51699ad6328"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.7/dot-agent-deck-darwin-amd64"
      sha256 "1ec051e891b1206b6d379c0d129705ccb09cf67210d399b494317992cbd2a350"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.7/dot-agent-deck-linux-arm64"
      sha256 "ddee5c38b64277d231d24fdcd395f80f8b67fb1e5743ff20d6ac4c02a97035fa"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.7/dot-agent-deck-linux-amd64"
      sha256 "804467b3fdfebcdbe80787a810c6ea385c066b3f819bf1403c9f77a9b4c5ebf3"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
