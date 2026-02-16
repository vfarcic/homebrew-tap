class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.2.3/dot-ai-darwin-arm64"
      sha256 "7b92292aee4ce7b963222a4103f335dde6ba3ab784b01f6571f793570e9a0f7b"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.2.3/dot-ai-darwin-amd64"
      sha256 "dcfb85a0216bd88c3034ceaf0995307be54e2f0da12b7d240f73ce29cacbc330"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.2.3/dot-ai-linux-arm64"
      sha256 "fed924d35fc82b68495862b2bc526344322985ebd27681e3237064db63062369"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.2.3/dot-ai-linux-amd64"
      sha256 "62611175be1ea3bf72c8e881c5f37215f1a2521050dc03f11be0858cce5392b3"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
