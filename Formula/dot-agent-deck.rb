class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.35.3"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.3/dot-agent-deck-darwin-arm64"
      sha256 "51d69db91da8deb7a4a8ed2c2b7898e0c7a5fb10c8925fc8d400f93c37bfde29"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.3/dot-agent-deck-darwin-amd64"
      sha256 "9bad1421029a1143fa9d25babc2a415c34bb53b4229020980d7530a4283732b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.3/dot-agent-deck-linux-arm64"
      sha256 "5460d882f70651038f09873b69686dabbe956e7b4cbc757b322cd6c163132875"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.35.3/dot-agent-deck-linux-amd64"
      sha256 "20c55209d25fb55808f90499792538d5adf00cfce0f83173d84824ce90a50605"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
