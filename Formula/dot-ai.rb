class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.16.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.2/dot-ai-darwin-arm64"
      sha256 "8e965138b8c5150bcf00106e96c6e8672fc17305fbff0f19a4074016c33119f0"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.2/dot-ai-darwin-amd64"
      sha256 "efdc7e8254d80e705827388be2c7a96f8b81a6f885bf5b94369b2e71b55b6f37"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.2/dot-ai-linux-arm64"
      sha256 "e005659d86988ee20db6dfaafdd50157da9242d8d282ca4ee7db9e5024334e02"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.2/dot-ai-linux-amd64"
      sha256 "2705df90abb6d22b7d41459f3c36d9c44b8afc20811a30f697cf8df18616e676"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
