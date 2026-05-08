class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.17.0/dot-ai-darwin-arm64"
      sha256 "68bd5ab63f0331eb8ec3da37f81ae5552cd4149d5be47a302f612dd61259a89f"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.17.0/dot-ai-darwin-amd64"
      sha256 "ca97626fca52c9d21a5ee5b68bea865b07eafef576c4db2caf299b4e4f43ccb3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.17.0/dot-ai-linux-arm64"
      sha256 "2e38ad0724fbaf37ec3b27ebecea26038d688f1e56c8876babd84a05a3209c4a"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.17.0/dot-ai-linux-amd64"
      sha256 "9d677fcf683de8ba2843d03c353dd84690b58ed2cc5ea46a77051f1c77f2a753"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
