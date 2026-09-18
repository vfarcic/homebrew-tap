class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.41.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.41.0/dot-agent-deck-darwin-arm64"
      sha256 "60015bed91108541ffaabda442293efc5e50801ddd84bb6d002be864d54daff2"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.41.0/dot-agent-deck-darwin-amd64"
      sha256 "6e0d67bea338fac639a66ce4c1cf2e31ef458c55bfc568d51a76a6aa3aaa307f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.41.0/dot-agent-deck-linux-arm64"
      sha256 "5ad0d21594739a56f7040dd55ddad30a994f7a0f7c29df6754608bc6656c5829"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.41.0/dot-agent-deck-linux-amd64"
      sha256 "86ea39485067afc2b58bf0c53bb19fdae9ccf43288bac8c6cc3ef5707c6def87"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
