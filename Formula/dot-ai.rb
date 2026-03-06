class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.6.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.6/dot-ai-darwin-arm64"
      sha256 "ef47273e62ed3d339bc38d5fd1b28fda8c4111a88c4e4b657583eb7bb3be78a4"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.6/dot-ai-darwin-amd64"
      sha256 "a347d3178b05b2e94fc72e745c649cb1b2571c01a61eb64c5bb198f5034df279"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.6/dot-ai-linux-arm64"
      sha256 "e957bbf717887f4ad12da8188d70aa672b3a5dcf6b12925f12d85eb85e7e9e02"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.6/dot-ai-linux-amd64"
      sha256 "011adaf4c4922893a0ddd0aaadb9d23594379d03864ed15b8ce2586f40367aa4"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
