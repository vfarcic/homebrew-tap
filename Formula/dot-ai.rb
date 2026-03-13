class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.10.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.10.2/dot-ai-darwin-arm64"
      sha256 "a4af43b745ef5e24add2b19fd7368481d4a4939a24a9d4a014d66ee46ae79c49"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.10.2/dot-ai-darwin-amd64"
      sha256 "3d93a9b630b5eccb676c27f95630f791a7b0ab011298fdac05e4ef8b39618df9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.10.2/dot-ai-linux-arm64"
      sha256 "23a2dcdd429178702fa9dd009e5e8ba7d2da520918c57467a12432b6f554f91a"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.10.2/dot-ai-linux-amd64"
      sha256 "080f451ba5d31da83e3e70f8b3037353d0947a170c5fd1334b066fa3de58c125"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
