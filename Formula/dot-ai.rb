class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.23.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.23.1/dot-ai-darwin-arm64"
      sha256 "be570b1bcf09cc4e07f6ccd7902d5394237e7a1fab6a90db49abe7c294871695"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.23.1/dot-ai-darwin-amd64"
      sha256 "56727c299a0a6b96022be3539fdb485cedc2c87101d570a05ec7f9737cc4518c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.23.1/dot-ai-linux-arm64"
      sha256 "0bab6684a8571fb28c5c234e5bb97bdea5bcf0ffb59fcf56579cc640d39bc485"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.23.1/dot-ai-linux-amd64"
      sha256 "b8c6622037d005f2c7d7197deeeab63c47b87e49ab369c4c169cd36edb3ff159"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
