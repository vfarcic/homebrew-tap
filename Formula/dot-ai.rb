class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.6.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.7/dot-ai-darwin-arm64"
      sha256 "1e11cd0ab5838017173222afcd1ab319b0db9d8a6c5aa279cf741dd917388c93"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.7/dot-ai-darwin-amd64"
      sha256 "7022d3b9bb84fbcf2fe16fd22ad71f31e9f665ec545b560eeb0ba4b1c451bfa3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.7/dot-ai-linux-arm64"
      sha256 "bbf07be67aed9b9cbdef832836352cfafca238124d9ea57426fffa68dd7975d0"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.7/dot-ai-linux-amd64"
      sha256 "7b68758e8a86dfb434ac1b23c01478ba1d975a7bfc3a05f7ebb069fb312a5aad"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
