class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.1.0/dot-ai-darwin-arm64"
      sha256 "bc0ff499c8525a8b6b8721afa6922c4620c0a671b350f96addbe74dcc5323da8"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.1.0/dot-ai-darwin-amd64"
      sha256 "2e1d3500bca9fc9777c5697d086b14578c4abc3f54728bc9e1431a2876137e91"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.1.0/dot-ai-linux-arm64"
      sha256 "22312c13d8e9c4ede633c8fc58a352c7599b0ddd5937a10556259ee11477e7ba"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.1.0/dot-ai-linux-amd64"
      sha256 "4cff04999331b588e49cf0251eb9a3dc7186b554589990688f9ebd05a606ea8b"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
