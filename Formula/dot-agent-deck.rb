class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.49.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.6/dot-agent-deck-darwin-arm64"
      sha256 "027e2ed09d3879eed5aa487b9cd92f8f7cff169fac8c820253e82673de9bd120"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.6/dot-agent-deck-darwin-amd64"
      sha256 "21635e64667c90f77bc9270685ddf3022d028ff37035227a7942143b7e2ac5d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.6/dot-agent-deck-linux-arm64"
      sha256 "0aa72c165dae0bc8c5a68a4d05d866d8c35ce1e34150614e6b1e2ca2375d3e72"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.6/dot-agent-deck-collector-linux-arm64"
        sha256 "0898c4fb2ba8831deecaac4d0aff2ab70ab920e5a691755470feec189cda270c"
      end
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.6/dot-agent-deck-linux-amd64"
      sha256 "e6cb733df58393a0d1de459d7ad922710bce26242f24fdb10a3748719b5ff17e"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.6/dot-agent-deck-collector-linux-amd64"
        sha256 "7ae430c250b27907e7496cca265a219b6b949c6e60bc822b0db2399ff776a3ed"
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
