class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.3.0/dot-agent-deck-darwin-arm64"
      sha256 "a17f2f3ea1a32c6d2ffed98cc353444db08d6b0ebee027b9beedb15bd9adcec3"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.3.0/dot-agent-deck-darwin-amd64"
      sha256 "09896919c8daef81fbcde0a304fedb3beb2a99385267f7630e1eed49f0aefbda"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.3.0/dot-agent-deck-linux-arm64"
      sha256 "9f446576666d13385d2ef5e11f5661c3c34accc0107e97fe396a6b78d09850b2"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.3.0/dot-agent-deck-linux-amd64"
      sha256 "f2f7d710cb9868dd6a2e26afa69cd26f2c6d76ebecd1e3949b96a7530cccd60d"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
