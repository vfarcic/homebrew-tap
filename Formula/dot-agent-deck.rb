class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.35.2"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.2/dot-agent-deck-darwin-arm64"
      sha256 "c683164e51c47542346f8e9da63564af342e0992dd59d978efd8e0629a8a9033"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.2/dot-agent-deck-darwin-amd64"
      sha256 "0cf88d3aba10c9cdb30001549ae439fba7a29b1649441944df3292cc50bd5801"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.2/dot-agent-deck-linux-arm64"
      sha256 "5bd0d9251c1b1d4032e333043dce653b71b31e0f8373ea45d4ae4c6874395029"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.2/dot-agent-deck-linux-amd64"
      sha256 "bcb1571fcbe3bb82edc076cc07c8ea5c00e7a2e97b320b6f5abfded5d45addc5"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
