class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.29.1"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.29.1/dot-agent-deck-darwin-arm64"
      sha256 "726a2763828409d6f5df011f2493c7533706adfffc2e3bc9661296301632fbe5"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.29.1/dot-agent-deck-darwin-amd64"
      sha256 "c06fa5caab7815f6fbbd8582ddc5ea919d11b78223326eda25f35d1a9a1b55f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.29.1/dot-agent-deck-linux-arm64"
      sha256 "9f5778507bfeb94675ccd49127e3ba813b54016ed7e29e01fca0f4d3cdf78162"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.29.1/dot-agent-deck-linux-amd64"
      sha256 "fccf72904839cf499fd675031c58b0e6abaca84843926d511b3ad88f7fabdaf7"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
