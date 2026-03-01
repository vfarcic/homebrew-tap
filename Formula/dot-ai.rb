class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.4.0/dot-ai-darwin-arm64"
      sha256 "dcc8210647916ef618ae0939343694e252c6f1d29cc78e2d9fa81075b04bb040"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.4.0/dot-ai-darwin-amd64"
      sha256 "3ea12e13535bf1560ce94015e359201e6267769a07a96e3bfe2cf6a6d0a4ff01"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.4.0/dot-ai-linux-arm64"
      sha256 "f1c7847aeea74e3febd3bc715e67aa9725263a7eb8c85b0a09ec8aebb34f367f"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.4.0/dot-ai-linux-amd64"
      sha256 "0e5a0851afb4bca8d30a1f7738ca331f198cfd92fd3d17c89f7f819056c106e3"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
