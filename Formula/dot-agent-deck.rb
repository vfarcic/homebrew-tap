class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.40.0"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.40.0/dot-agent-deck-darwin-arm64"
      sha256 "ab6cae3e6089542f21045ffa046c342987ffa2b03f8834ae01e32e51b382303c"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.40.0/dot-agent-deck-darwin-amd64"
      sha256 "9d0a28d372912c3ae43fc7fa04deaee9bff67b65328e42eed1bad74dae06d57c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.40.0/dot-agent-deck-linux-arm64"
      sha256 "705ba1958bcef6a2794f488c52caef286deb236967a4fe1e04c90a2dfa4d253e"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.40.0/dot-agent-deck-linux-amd64"
      sha256 "8328f740d04152fe22504a8c12c09aecc4af179e20b82fa56cb917ae21ad00e4"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
