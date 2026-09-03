class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.39.2"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.2/dot-agent-deck-darwin-arm64"
      sha256 "d88466eb9e97cff61343beba203cd03a08f44cd534198eaa1f486791584d2af0"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.2/dot-agent-deck-darwin-amd64"
      sha256 "969ff82d173815fde38192d4a6208a900b93744dc2622632c0974eff562ae227"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.2/dot-agent-deck-linux-arm64"
      sha256 "a71e899f404f3722e2be879bdfad0040b1eb023b4c6338f4838f1f518a55c55a"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.39.2/dot-agent-deck-linux-amd64"
      sha256 "22cd0cc41e778effe170a676d4bc358dc1e43ddf18a1bc3d590774fdb83f6da3"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
