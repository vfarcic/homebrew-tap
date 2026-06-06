class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.27.1"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.27.1/dot-agent-deck-darwin-arm64"
      sha256 "1017cffc5e9c4ca174dcd0a6a80a97513b958876f8f7dc11eee3c9d1735fd30a"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.27.1/dot-agent-deck-darwin-amd64"
      sha256 "1598c2fdf97ec02ddc273ee6753e960d421f4fdab791bcb76fb7b9d6d2db655c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.27.1/dot-agent-deck-linux-arm64"
      sha256 "699ec447c1874cce85899871fdb8d8d85f5c47f5fb747a309715bc96a9c6fb46"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.27.1/dot-agent-deck-linux-amd64"
      sha256 "649c45f6e40adb918d1a2b98e28b33d68ce5108ab7e53e673192993af621bf49"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
