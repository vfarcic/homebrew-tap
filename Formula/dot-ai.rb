class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.5.0/dot-ai-darwin-arm64"
      sha256 "1acbe31c9ae5bb92b497f0edef47c22a02e6740416b0326560570aff67540055"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.5.0/dot-ai-darwin-amd64"
      sha256 "7f402747dc159ae6c1c99befdf7c15d9956e10f29ae59b1adba494f6b80ad24d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.5.0/dot-ai-linux-arm64"
      sha256 "83e41d9010de66e79b517256e7b474a245a4d6bbb4937d6056a35f77726cef86"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.5.0/dot-ai-linux-amd64"
      sha256 "bcfe8fffc1f34b0799f8d6b9c950b00ea8fc670dbf2df0d54201ff7d50f344e2"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
