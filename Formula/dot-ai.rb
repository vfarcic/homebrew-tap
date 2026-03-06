class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.7.0/dot-ai-darwin-arm64"
      sha256 "18a33b5c7de5d07bf0e3275f478acf5cd766043844e9a5ea6cc71ca70400274d"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.7.0/dot-ai-darwin-amd64"
      sha256 "b2d916dfa1aea82b1466ecaaceecfce18bc0eb261d845da781bdb829b81831fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.7.0/dot-ai-linux-arm64"
      sha256 "181361a6ecdc5dd976d77967647b50edf7a2ba2ee115cbabf7b541a6436b7e78"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.7.0/dot-ai-linux-amd64"
      sha256 "e7beaeb9de2cda7e884ad1224274d4f1cc53d18d5134e1634cc0cf9a5eb0b39c"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
