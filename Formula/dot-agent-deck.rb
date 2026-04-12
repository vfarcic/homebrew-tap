class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.20.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.20.1/dot-agent-deck-darwin-arm64"
      sha256 "3796139ad3162a9ba7f10c497f0baf82aea4cb8ccc6b4c32040d417dbf8d6235"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.20.1/dot-agent-deck-darwin-amd64"
      sha256 "2b473e6f8a495d84d56aa8dcbe0514bf7ff72dfcb0b2dd3f695b625c69b6caae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.20.1/dot-agent-deck-linux-arm64"
      sha256 "eaf0fc8e1cb66650f786a5e2749da22b95292ac7e7f0de1a3d4e6f3850e21033"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.20.1/dot-agent-deck-linux-amd64"
      sha256 "dbfee0fd46f0903a128003da7b70a0318160fb4f3dda4894079570422eb5cc30"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
