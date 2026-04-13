class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.0/dot-ai-darwin-arm64"
      sha256 "d9335cf7842452c0eefdf493c0afe525f5c0cd94ea8e1f431a94ea23a8141151"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.0/dot-ai-darwin-amd64"
      sha256 "6e2ba6bc5ded202e0f6d16e8a60f944e0c98cdfd72e94d5b8075e4c807309018"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.0/dot-ai-linux-arm64"
      sha256 "acd448726e69044779e6e82eae1f8f975482005ecb2b84a6a4f193a6c1bce649"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.0/dot-ai-linux-amd64"
      sha256 "b593b082f7b883d5e9d758e3310eb365f45ce5248e91a640fe108573daccdcc5"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
