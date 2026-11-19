class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.51.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.0/dot-agent-deck-darwin-arm64"
      sha256 "fc373747e8f72707bf738c2c01bc134afe47752a1c238c2ebb9496bfe873148b"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.0/dot-agent-deck-darwin-amd64"
      sha256 "3aacd1bb1e47682d647d597b1765c78990c24ee6ca532897504475b702ca00ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.0/dot-agent-deck-linux-arm64"
      sha256 "eb034221bf8748e1769680e6c349a3be19de0880c6572174c658201149f69def"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.0/dot-agent-deck-collector-linux-arm64"
        sha256 "9dae2c9c5dc7a532e74ff4c747bde7344d208a3b5a28c76b4211b4c5e0625cf6"
      end
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.0/dot-agent-deck-linux-amd64"
      sha256 "8f77f01f1acec3c1b43a509bcf91aa07319c64dbd6332dbb11e5d303ad43c667"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.51.0/dot-agent-deck-collector-linux-amd64"
        sha256 "f7f4784a4994295a997f5e75d090fdadd6502693e8cfce1d2dea6282438ef16f"
      end
    end
  end

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
    if OS.linux?
      resource("collector").stage do
        bin.install Dir["dot-agent-deck-collector-*"].first => "dot-agent-deck-collector"
      end
    end
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
    assert_match "dot-agent-deck-collector", shell_output("#{bin}/dot-agent-deck-collector --help") if OS.linux?
  end
end
