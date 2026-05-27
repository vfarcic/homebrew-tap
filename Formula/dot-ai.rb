class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.20.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.20.0/dot-ai-darwin-arm64"
      sha256 "12d68ed6732ea107781391a33fba088cf2e30d190b1f0854ec71bba71d55e310"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.20.0/dot-ai-darwin-amd64"
      sha256 "9db723e1a08aa32754de6dde2626c507c5c85e752bcce1c7701b04b52688f2eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.20.0/dot-ai-linux-arm64"
      sha256 "fc834ee6151d4fc00815078536dc5f0c544970383176a757a6e2ab02f00e793d"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.20.0/dot-ai-linux-amd64"
      sha256 "ee2b19fc6df3020f21f927c72ccdfecb605cc8b92772df8c881d20e019e7d742"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
