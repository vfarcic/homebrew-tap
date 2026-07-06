class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.23.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.23.1/dot-ai-darwin-arm64"
      sha256 "028df8d0e42034b4bc19946cdd143600808395e542c5231a840997e2f6b304a6"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.23.1/dot-ai-darwin-amd64"
      sha256 "b34cdea7846ca425cbd0806edf1e011040083464ddcf7a7080dc8a69eee7c663"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.23.1/dot-ai-linux-arm64"
      sha256 "ed54ae28e4bd8b1254509c6238fa9da5f0f6cc5d63c31133a79f83927f9685eb"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.23.1/dot-ai-linux-amd64"
      sha256 "c8c82b6353e5ea0bc54466eae4676331925a96f9bc1d80a75d7c73dfe0cf5f46"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
