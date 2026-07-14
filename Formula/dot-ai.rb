class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.24.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.24.0/dot-ai-darwin-arm64"
      sha256 "1b599e00f57f0f01b8dbf0576f031cd92f555f2cd148ccdd2dbed27d23d90b9b"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.24.0/dot-ai-darwin-amd64"
      sha256 "f7db782568068df12f95ac559b44e49f424e80db088ef172533138f890b2479b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.24.0/dot-ai-linux-arm64"
      sha256 "6c723287e9e563a37eb06dec04b6b1f1e8e6d8490ee9f9be25dc621c98444438"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.24.0/dot-ai-linux-amd64"
      sha256 "a3ac8ce5061e55dc5878c5b5bde713aeaf507a613a4ef8b7df016199ffdfbcac"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
