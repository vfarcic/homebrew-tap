class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.0/dot-ai-darwin-arm64"
      sha256 "93d0199733cf2f26b025b1eb27b80db21c3ec60aadae03b52ab1c7c5f41836a6"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.0/dot-ai-darwin-amd64"
      sha256 "a90f1b987191e96a21a52deac833d5de73aa4174f63798540c46a0e863fb4bdd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.0/dot-ai-linux-arm64"
      sha256 "89c5e9bbb940d67c53f1e96f53544529ff0f1b76d1c883985ff3e80d37574800"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.0/dot-ai-linux-amd64"
      sha256 "041123a7b53346dd1c27687063029b6228d3c55f98ed3ba236b2579304bf5aa3"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
