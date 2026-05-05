class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.24.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.4/dot-agent-deck-darwin-arm64"
      sha256 "d141fd83e27e1ea5c88854f333aa545e72907aa70542e47ccb4fea53fadfb66e"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.4/dot-agent-deck-darwin-amd64"
      sha256 "6a099001338c269f2d0672c2638d5d4733577097db3397201297fef53a8d0f62"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.4/dot-agent-deck-linux-arm64"
      sha256 "ed111a488ddef480fa0cf946fa7a0729488626700b95f0fe2e166abdde84925d"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.4/dot-agent-deck-linux-amd64"
      sha256 "3775cc31dd2e33818af1545eab9755c4d71f5c904c136973ce9e295984f4f123"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
