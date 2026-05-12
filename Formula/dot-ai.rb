class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.19.0/dot-ai-darwin-arm64"
      sha256 "18e8beca8a2b0c4c130c74f3049cb500402f3d498864986bcf8acf87ba682a86"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.19.0/dot-ai-darwin-amd64"
      sha256 "644ab220b50ee158a65fb0fcc36a09963e4c701d520d18376af69be9be44ccdd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.19.0/dot-ai-linux-arm64"
      sha256 "68f2d2534c73995137d5ada6619ea34d92ff2d92804a2c32f6bd9b26c290d798"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.19.0/dot-ai-linux-amd64"
      sha256 "cd771ba5bce18daa23e5c6f3f5182406d9e12bff0ab8d01c37cd1b68f6e52465"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
