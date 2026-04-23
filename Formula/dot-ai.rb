class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.16.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.3/dot-ai-darwin-arm64"
      sha256 "fb07520013831dd701a2f834c352281ef9f08a7eb5fe1b16d5420bbe0215c54d"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.3/dot-ai-darwin-amd64"
      sha256 "a54e432b050ab9c63b4bafabe734d97458ecfc94a08117be558e44fe0a1f6221"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.3/dot-ai-linux-arm64"
      sha256 "3ab37c071dbd011390b6a7831758e924aba33bad11c8e75d8ae20d0d65ab4a8a"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.3/dot-ai-linux-amd64"
      sha256 "902901a1a9acaa511e35d16311b1ad1460b38c3a399521bc6f2e002e4226a174"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
