class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.16.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.3/dot-ai-darwin-arm64"
      sha256 "2634e9c1a93c9ba9a5bc2aba7bde7ce3a1bd841f508c8ffb7839bbcfbca947fa"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.3/dot-ai-darwin-amd64"
      sha256 "88d5e7dc80d763ce7f9b4c3995e169e25c3691f132d5083f13da65d69294dab6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.3/dot-ai-linux-arm64"
      sha256 "1347271e424763dfb03b58b9c8d3c596bf2d459a7403428a3d9adbb53da82fca"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.3/dot-ai-linux-amd64"
      sha256 "78900c083496ecea667ed5aa7b52857bfa05dd16b6ba86fc12ce4a1c21d3eed3"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
