class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.41.1"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.41.1/dot-agent-deck-darwin-arm64"
      sha256 "2672645a002d2156760a40e41af767cf309ca13c98b25d5f1446fc16bdeab103"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.41.1/dot-agent-deck-darwin-amd64"
      sha256 "be1914413fb364aa7bb30606cdb2cdde5187a79743c343623ae313b882535850"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.41.1/dot-agent-deck-linux-arm64"
      sha256 "a08b0b4d28a6c8059766fbf07ea635ae02bdf89e65d75171fa14f7a67e4065da"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.41.1/dot-agent-deck-linux-amd64"
      sha256 "5cc61766547137b71392b644a3cb4fc470a27f098ffb52c3b766336fc4a296e5"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
