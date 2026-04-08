class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.15.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.15.2/dot-ai-darwin-arm64"
      sha256 "8f9462ac10974e6f490d4162b4d84943379a4a5a9463e2ec45a8b3409d92c381"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.15.2/dot-ai-darwin-amd64"
      sha256 "0c0984c08acb9ef0e4f97639ea9176221f83c9589a5f2ce2dbdc061a852e34f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.15.2/dot-ai-linux-arm64"
      sha256 "7f02a87a4e8cb640b77370518918d67658966e0a868dab09e64f8bd20b5c9240"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.15.2/dot-ai-linux-amd64"
      sha256 "6ed7a8772b09e7afb11375d1d389cf1341838eeff2352d8544ce5cc89903e1a5"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
