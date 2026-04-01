class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.10.0/dot-agent-deck-darwin-arm64"
      sha256 "aaa0f008fa267bb5be9f5c66aff37b472e5a65ae2771af70cea6b55c97693e7e"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.10.0/dot-agent-deck-darwin-amd64"
      sha256 "efdcf3665259eb7e5ae83dccd28eaa2eabef3f5133fd4f30532570a412d89e9c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.10.0/dot-agent-deck-linux-arm64"
      sha256 "8d9d9dd7b6a1848cc42b9a7a26fa2f2fb6eab3881df3bf3fb274068bc95a09ec"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.10.0/dot-agent-deck-linux-amd64"
      sha256 "08de0e1e7ebe1a73bf4c601f21ab388e5b8af3397ea22f49462c9c265449283b"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
