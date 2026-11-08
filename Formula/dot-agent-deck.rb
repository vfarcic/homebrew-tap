class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.49.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.7/dot-agent-deck-darwin-arm64"
      sha256 "7487006e2062d1c1628c7951c3a5852fef55739445ee96a25b5882b2a6df2c9f"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.7/dot-agent-deck-darwin-amd64"
      sha256 "9872e3be37cd7bec52997a0db84f0ea0c70ac674432de6ce6b59fed830df97e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.7/dot-agent-deck-linux-arm64"
      sha256 "8e70a98d96f0a1a8ffa93765e5177f242820828ba01867f681a313719772be66"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.7/dot-agent-deck-collector-linux-arm64"
        sha256 "ab7513fb9d8559d1615c33088f9fcc75a5a860b56b3f9b8bf41e50e1ac98cb39"
      end
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.7/dot-agent-deck-linux-amd64"
      sha256 "da721a2c60f2e3bd9c5ffc2b666917fe657490746d315cd7375e95fc0efc4309"

      resource "collector" do
        url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.49.7/dot-agent-deck-collector-linux-amd64"
        sha256 "89aa5adc1a2eb5288c5d4bc38002fef295b594305a9d233412f2dec186234cd7"
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
