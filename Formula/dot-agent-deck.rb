class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.24.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.6/dot-agent-deck-darwin-arm64"
      sha256 "714bea18ac17136c881d8047fb3b224ad54400efd9c266f6f6a016792faa79c6"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.6/dot-agent-deck-darwin-amd64"
      sha256 "7b06608edbbda8a3684e8f86bd8ae9350d18ea6c5264170bf64b771e41d6f290"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.6/dot-agent-deck-linux-arm64"
      sha256 "43cc0cfefa73a32d3b47a4cfda67b1b62d1c6c5bcbb488036047cb8207cf7a5b"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.24.6/dot-agent-deck-linux-amd64"
      sha256 "798f157de0334b90f75ac4cb33960bb27f5c2ea5730da2300a03048cc2ee0bb5"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
