class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.15.0/dot-agent-deck-darwin-arm64"
      sha256 "288b757659486ea6aab7bdd587216dbbd4190b5eb8818010763e8d24678fd030"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.15.0/dot-agent-deck-darwin-amd64"
      sha256 "d4d333c236d56e78f048f01e5f03758c4059711bd5a62b4e99e2885fd2b33eef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.15.0/dot-agent-deck-linux-arm64"
      sha256 "1c309d61aeb2a7d6e96256f73c13eb8bbe1795c4446183ff234e2ca0847cc0cc"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.15.0/dot-agent-deck-linux-amd64"
      sha256 "a3cb0a42fcc9e2beeb5ad1ee1c48d29a788f63f81e4c2ed8fd0a31947cef7725"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
