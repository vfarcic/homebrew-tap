class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.10.0/dot-ai-darwin-arm64"
      sha256 "50f8f200a71b7e1eb3bbc723157ab95a0e865bdb4e37ba4d95e020082796bcfa"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.10.0/dot-ai-darwin-amd64"
      sha256 "3dd78b719c4f7b7978d55c27bb7b3b2cc18f28dc04545edb10c89a536a45a000"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.10.0/dot-ai-linux-arm64"
      sha256 "f5833862e0ed357b84f8fa48eebcf15b96e4f1f4e5641389d85fa2f2f9be6d77"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.10.0/dot-ai-linux-amd64"
      sha256 "1539f823390e712819d2662b0b577b5b04e8b5f2ecf7022ff93ec7cad69b585d"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
