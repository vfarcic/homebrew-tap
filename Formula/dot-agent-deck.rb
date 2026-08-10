class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.35.10"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.10/dot-agent-deck-darwin-arm64"
      sha256 "b7928e31a3e8737671d8045abe87577c9deb0d164be6f38c2b8ad29eb19854e6"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.10/dot-agent-deck-darwin-amd64"
      sha256 "0f4d1f06a89532464afeab7cd7eba22d5bf042c809e9606828581c944b246c7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.10/dot-agent-deck-linux-arm64"
      sha256 "279ca208693ea1daceb8928691371781dce85d29e85cfb82445a0afb15a89a22"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.10/dot-agent-deck-linux-amd64"
      sha256 "af37ad77a72e1b4930edca0a32fe1c44caee587de72021f946629282e6582135"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
