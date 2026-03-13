class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.10.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.10.1/dot-ai-darwin-arm64"
      sha256 "c62abe8a7f962011d2e88b0b2266f37b3a441f39fa21c9e19dde1dc7889d5346"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.10.1/dot-ai-darwin-amd64"
      sha256 "2d63eb5ad8eea6e52d8d6ef50df067de05516c9b52bf96463bb46804be86e312"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.10.1/dot-ai-linux-arm64"
      sha256 "a62451facf47f103ba15c33e5751a1914b6d5277a0887247cd781f060ed29c18"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.10.1/dot-ai-linux-amd64"
      sha256 "31c6d2e40db99212fe97292cc0ef9c8adbe72fe9604ef6ae4c6026d95cc831d9"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
