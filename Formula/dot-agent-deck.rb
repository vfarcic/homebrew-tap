class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.14.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.1/dot-agent-deck-darwin-arm64"
      sha256 "674ca29952dbe96f906a27ce74a887d0b131396e1c648a6c65c35163cec9efd7"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.1/dot-agent-deck-darwin-amd64"
      sha256 "fb894c4106578f9225ed5a85324a06d432139d149ac7f5993bf241c60330288d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.1/dot-agent-deck-linux-arm64"
      sha256 "1e712159d35238fdc689ced74c7ed821c84745f06378d7758df94acc89944506"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.14.1/dot-agent-deck-linux-amd64"
      sha256 "991e513ef5b9ad638edddb9193050c5b676069bb054f46741b690ad6f7f0ba30"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
