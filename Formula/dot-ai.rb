class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.25.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.25.0/dot-ai-darwin-arm64"
      sha256 "d6f4ae0c54b6f9a65ffefb3ee293d344b7decd597916dd91ce3251cb13dd04d1"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.25.0/dot-ai-darwin-amd64"
      sha256 "465a519e94086b271218ae5491a36059995bd09086361c152c6ff0145149a15a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.25.0/dot-ai-linux-arm64"
      sha256 "1fa48061bad0d0d37f496b7cdacd874b16a5232b633bf61300f4898080dd3024"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.25.0/dot-ai-linux-amd64"
      sha256 "7580d61a1ca1b27c24efd3339f4143998662a6fa2cb6c93864f9320919f09b2e"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
