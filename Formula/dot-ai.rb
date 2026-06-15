class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.22.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.22.1/dot-ai-darwin-arm64"
      sha256 "9e795fa4a7397de8e586f7ca452feef33744776fe11f885057e67797539d637b"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.22.1/dot-ai-darwin-amd64"
      sha256 "989edc93388775c6b9a45c503f67f99a5bd35ed350a65d42cfe51086dc7a4250"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.22.1/dot-ai-linux-arm64"
      sha256 "bcf29f19ff8bd9bf958b8b2f7c33e2fecf95d3bae00c5ade6690ddc973dec1e2"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.22.1/dot-ai-linux-amd64"
      sha256 "d24aa3e97730187e0899de268182a56b800b75763d85707403d17f1831d8ad59"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
