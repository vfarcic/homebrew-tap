class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.22.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.22.0/dot-ai-darwin-arm64"
      sha256 "b0597ae86f7d59e7bae868c1f9a214d8c322f00f6faaa1323611472171314be0"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.22.0/dot-ai-darwin-amd64"
      sha256 "73ceb95afa5a6065d3f0e4f39d28a840e376301212d5178531757253fa3e9e72"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.22.0/dot-ai-linux-arm64"
      sha256 "2e306b07fdae608643293eec528c2e3042f8a90f3ddc8db2e9f9edd30657330d"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.22.0/dot-ai-linux-amd64"
      sha256 "6fa25f91c42001a87e4bed2c1a9c33f9a89395d4ed5bbf86945f63414817eb08"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
