class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.25.2"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.25.2/dot-agent-deck-darwin-arm64"
      sha256 "6c31b66a1972d2a9a8c7cdb2c1aaaddaa44efbe9963ed5dbae93558699bb88ea"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.25.2/dot-agent-deck-darwin-amd64"
      sha256 "3bda288cf7bbbbd5771d6a1144675bf49311d288526e2607b738dc66be2f9726"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.25.2/dot-agent-deck-linux-arm64"
      sha256 "0223efcf2bf292641fc9cfb62262f32fd649fa586c71b329f4a92781e3995eb4"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.25.2/dot-agent-deck-linux-amd64"
      sha256 "e9fb1f9c0e9d5b7efb8eecd3d19a81f5c9eab02ea3407445d09213369d7503d7"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
