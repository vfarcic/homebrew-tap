class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.3.0/dot-ai-darwin-arm64"
      sha256 "5c3ae149b486ef2400c6b6e3e9e472f47f17f679db70910cd35bd4bc4bc66ca9"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.3.0/dot-ai-darwin-amd64"
      sha256 "e78efc253747755cdc03da414257a969fdb7a39e1d0035067c786ccf96145ace"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.3.0/dot-ai-linux-arm64"
      sha256 "44e1ec8d4f7a6c13cd9652d84db646784c485b433a3de0957439ad3311a7d438"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.3.0/dot-ai-linux-amd64"
      sha256 "b45bff9006b0d11d422ccf2ecdc5015dea82494505b0e777a1bcdde9c6a5ff0a"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
