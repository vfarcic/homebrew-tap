class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.50.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.50.0/dot-agent-deck-darwin-arm64"
      sha256 "39b44a1c11b9329daa93de9f88f84df14755b883fc6af50deee2a9fbfb27b281"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.50.0/dot-agent-deck-darwin-amd64"
      sha256 "d554e9fe4accd761dc1286c5d4196d1b95349d7e6562d604dc1acea4d111f431"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.50.0/dot-agent-deck-linux-arm64"
      sha256 "f74437565af74bf9f33811ddacbea878933dbb93ff2729447f6f18150154e957"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.50.0/dot-agent-deck-collector-linux-arm64"
        sha256 "32768a12e71f7bae0dfbb1c1f1585a5849226182a9403d52de40b647a5e29bd2"
      end
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.50.0/dot-agent-deck-linux-amd64"
      sha256 "5e531ea0bfb388e5eb30e7dda493d9d2584d8bd04c97718cd8997e73f508f297"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.50.0/dot-agent-deck-collector-linux-amd64"
        sha256 "318b56c5fa999ce1e9beb95879d5b6a73eb40b6a6596f10efb38012282c6adb0"
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
