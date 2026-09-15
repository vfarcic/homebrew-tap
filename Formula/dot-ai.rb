class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "2.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.4.0/dot-ai-darwin-arm64"
      sha256 "dbf14a5b19b06fa1f9c25115116ce1ef44f62e9e022ed33e9aebda131f80e2bb"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.4.0/dot-ai-darwin-amd64"
      sha256 "5c5b505d658157b524012bc3f4cc5b163c93f0ceeef92ae2623f0c11452791be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.4.0/dot-ai-linux-arm64"
      sha256 "4e1858b94f066f2ac45402ac481f0ee3e33db017c59d1888c634991e86f5099c"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.4.0/dot-ai-linux-amd64"
      sha256 "9a33d2c8ad5f6a428e042715e36a6548b5b8517430d84d75e8f4e85ef4109537"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
