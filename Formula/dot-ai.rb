class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.18.0/dot-ai-darwin-arm64"
      sha256 "f37a3df5685554a389040e91baeb04ce945f8b8c229c13e849746c7fe829a05a"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.18.0/dot-ai-darwin-amd64"
      sha256 "7de2f753c3cde4ed3e59f8c4500d32b1e4b15a3ad133a69f6da02e31db1047d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.18.0/dot-ai-linux-arm64"
      sha256 "f1f0f613d1951a7da70b6c0b07bb2d827b7cb3bbcdb636479038c3d4d2bfda42"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.18.0/dot-ai-linux-amd64"
      sha256 "d91d1eede0164742f09ad171d1d85a53bfeefd70eef8161302266cc4e586b561"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
