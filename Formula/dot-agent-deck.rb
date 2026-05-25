class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.26.1"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.26.1/dot-agent-deck-darwin-arm64"
      sha256 "1579922a778be696fc91414443ecdbd513be1cb2d733f7bf515c282509b73a97"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.26.1/dot-agent-deck-darwin-amd64"
      sha256 "23005ef134e43251254ddafd5ce8b655b872dd781364d8c4e1783dc64c7f4e41"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.26.1/dot-agent-deck-linux-arm64"
      sha256 "ebaf5ce3065efa7fcd48cdaafaa3f21f9afe0e3fdb1f8f8007103c1031cf4f91"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.26.1/dot-agent-deck-linux-amd64"
      sha256 "2126aba96225f399da21b004717da8535ec4a2f2d24dbd803e51e7e4f1ccf59b"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
