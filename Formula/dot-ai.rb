class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.6.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.5/dot-ai-darwin-arm64"
      sha256 "e333ad399f35bdc0da99064199d0f8246f88200ba32c93cf07d99a824bb14eb0"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.5/dot-ai-darwin-amd64"
      sha256 "2cd6d846347233adf6aa1bfc3f592f3cd46407cafd816ac3b76ff90e0863614a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.5/dot-ai-linux-arm64"
      sha256 "a6857fb4c44d4ec5d857fc4c49c7d4fbf73a0c02f99f20c481ec2398500cf84a"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.5/dot-ai-linux-amd64"
      sha256 "ef517e3b1d547022312a0b3a11b0e8e21e01f9afe5d88148e3758b4f9cc2c40b"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
