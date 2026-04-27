class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.24.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.1/dot-agent-deck-darwin-arm64"
      sha256 "6266f48404c7c2432d6fcba13b8b88a0762370eddbb167949d674b5684765948"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.1/dot-agent-deck-darwin-amd64"
      sha256 "10ca79c3a4da391a4793a4d3b2f635971bcdd15dc99ca84ae038d84b3bedb323"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.1/dot-agent-deck-linux-arm64"
      sha256 "8f42255cd2ad1fdb08b20409c5bc8a24b3fcb36e9029ac0b3fb183a7e4db2ada"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.1/dot-agent-deck-linux-amd64"
      sha256 "dd429c39116b60fab49003b445f920dbaecba926ab721ab6e8d99a9100cf4cc7"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
