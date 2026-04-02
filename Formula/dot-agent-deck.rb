class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.11.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.6/dot-agent-deck-darwin-arm64"
      sha256 "4afd1bc13dca8cf6580dc8ccfc80f4a33fa582839cc8760d452ff0e44f11677e"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.6/dot-agent-deck-darwin-amd64"
      sha256 "3c83fc367fb07dd5e0d71d4fd9aaa69021b996d4b469c271dae606bf0d0b2804"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.6/dot-agent-deck-linux-arm64"
      sha256 "f0e164c1cb89fb69759a8b36de14f2e81d75cc89078367328d319418b33df383"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.11.6/dot-agent-deck-linux-amd64"
      sha256 "8fed3cce20aa17741839313e2e1945f131ead4487bad4f58065260bb71101375"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
