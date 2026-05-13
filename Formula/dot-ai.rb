class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.19.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.19.1/dot-ai-darwin-arm64"
      sha256 "d960b75cb663ceb7f2cc31436623c65f29f831264485fd8ec7f4d2e1f3d99d1b"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.19.1/dot-ai-darwin-amd64"
      sha256 "4c9a6a5ea1b835bcdbad121147a486ed0b1c4a05e67770f98e39e72017fdd85e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.19.1/dot-ai-linux-arm64"
      sha256 "efa56cba2188602fa24c9ba88d24d34f3c56c4f384490273c398c6e0c22ab99e"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.19.1/dot-ai-linux-amd64"
      sha256 "b7704e391602c98c83ecbf226578ccf8ea44608f7796594b664a4dadaa3713cc"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
