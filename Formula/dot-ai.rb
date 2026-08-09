class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.1.0/dot-ai-darwin-arm64"
      sha256 "9286ab9f163f7401fdaeb6de280eee2b5861cba3ec4467f8c0e726cc2e8d8094"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.1.0/dot-ai-darwin-amd64"
      sha256 "e6bfb9ac841ed656507c000c9e3315166f20c0cca4b3c46feb0bfb8b6cb527cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.1.0/dot-ai-linux-arm64"
      sha256 "2dab7ff61006853b1cf699b860e6a8eb6451f7c45b1cb150b1b3a5844612442b"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.1.0/dot-ai-linux-amd64"
      sha256 "75fcbeb30416e6fdcd0c7d858e7469e1f7f807f0e7de95bd0354f748b0df019f"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
