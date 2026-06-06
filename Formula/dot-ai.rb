class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.21.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.21.0/dot-ai-darwin-arm64"
      sha256 "a151a8ffb3adbd68eb7280c5cedae1bdef9cb15b53a7d614d13a357193c3b69c"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.21.0/dot-ai-darwin-amd64"
      sha256 "132069847f7a5749d64f2676f837a7467f1362e4e1b937d8f7bfe7b23bfad3bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.21.0/dot-ai-linux-arm64"
      sha256 "d833cb0416b8d951ab13554f84e74ea2d334b30b9a62b5692bcaacbc10bf3005"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.21.0/dot-ai-linux-amd64"
      sha256 "480d876d252ef3f7d58e8de16861de32748514c6247b89667cc6bdd51984c3fe"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
