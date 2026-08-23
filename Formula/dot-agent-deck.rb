class DotAgentDeck < Formula
  desc "TUI dashboard for monitoring AI agent sessions"
  homepage "https://github.com/vfarcic/dot-agent-deck"
  version "0.37.2"
  license "MIT"

  conflicts_with "dot-agent-deck-beta",
    because: "both install a `dot-agent-deck` binary; only one channel can be active at a time"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.37.2/dot-agent-deck-darwin-arm64"
      sha256 "7e60fc9db732deb7b774b377a6f8a85a20f563ca8a4a1a5753dd685d7a2f1a77"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.37.2/dot-agent-deck-darwin-amd64"
      sha256 "33564d7a69de945862a8a42636b87f4453a6cb89364e6537a74c2e4b0ed9eea9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.37.2/dot-agent-deck-linux-arm64"
      sha256 "392003693631ce247ebd94e7d9b78dd61639986f1aa8f0bbaa453772a735ab5c"
    else
      url "https://github.com/vfarcic/dot-agent-deck/releases/download/v0.37.2/dot-agent-deck-linux-amd64"
      sha256 "8cb241676c4d869dd2b556c61a392a15aa2cd89050b5a5c083a8e3bf9de7b32c"
    end
  end

  def install
    bin.install Dir["dot-agent-deck-*"].first => "dot-agent-deck"
  end

  test do
    assert_match "dot-agent-deck", shell_output("#{bin}/dot-agent-deck --help")
  end
end
