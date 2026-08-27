class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.38.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.38.0/dot-agent-deck-darwin-arm64"
      sha256 "51d9948598d54b5702c3463fa4238f53a6d958640c716e1cfca553feab73240f"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.38.0/dot-agent-deck-darwin-amd64"
      sha256 "0c7dba44dff9df39456fd64bd8559e2ddc516cd3cff61dd9a081ae15ab25dbdd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.38.0/dot-agent-deck-linux-arm64"
      sha256 "fc9fe9c73be5980882ea459e8180392eeee41baa6ce78e8337aeaa8e9ee72d9a"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.38.0/dot-agent-deck-linux-amd64"
      sha256 "19a5b887c19112aaee829ccf80c7a494f777a7ccf950e5e562eb458cd2975a38"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
