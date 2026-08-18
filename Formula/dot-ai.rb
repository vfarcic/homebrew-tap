class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "2.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.2.2/dot-ai-darwin-arm64"
      sha256 "73867c989b32811c10b2455cd3de89db4cfab9471bb9492c7ae45a936ad6141a"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.2.2/dot-ai-darwin-amd64"
      sha256 "57dfefbdbbf27783e9c5a51ee536d007f8d24bb70dfe0afaf61d452de3bce3d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.2.2/dot-ai-linux-arm64"
      sha256 "031503d3b80da05469022a2b379d0b899c3f26b5b6463d707bdecfb4ceb0128f"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.2.2/dot-ai-linux-amd64"
      sha256 "cefe55df1357162351af8b6d30275bf9228bd5bff30d4999e1a499c6ec332a53"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
