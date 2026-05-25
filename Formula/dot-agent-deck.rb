class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.26.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.26.0/dot-agent-deck-darwin-arm64"
      sha256 "d85d72c1f41cb620fb0920c490752c38efaa7376bfa14936b71ddb7def2a4725"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.26.0/dot-agent-deck-darwin-amd64"
      sha256 "b52cc1e32f89058f057e4befb220060ea9930b26866b03d9d7379dcc1b44dcce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.26.0/dot-agent-deck-linux-arm64"
      sha256 "ada0ed5f4b95bca74ab827621788bc295e384142b63b6774946d30c0c76e6734"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.26.0/dot-agent-deck-linux-amd64"
      sha256 "b52c037956161cd6a760e966bcc57ca6c7975e9795fe8095684d35f6a167bd66"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
