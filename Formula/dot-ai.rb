class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "2.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.3.1/dot-ai-darwin-arm64"
      sha256 "75cf826cf12c452ab88ad943b49390ccdd79ce86cc0459fa84eb5cd795de82e8"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.3.1/dot-ai-darwin-amd64"
      sha256 "808e88afbc620722019c609475ffc549ab04a94dbca7ef81425d0faee6d2e1f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.3.1/dot-ai-linux-arm64"
      sha256 "6de823159cd9528659d62047557744dcb2393822a44f68957f8b556d83e24ba6"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.3.1/dot-ai-linux-amd64"
      sha256 "dc46dd6bf9c7e70e5839ecc13ad539d411e5f045489f07732b87970783b1a3f0"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
