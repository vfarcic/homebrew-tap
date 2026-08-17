class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.2.0/dot-ai-darwin-arm64"
      sha256 "25fbd8d655f25b0483d7b8a10392490aa796cd4e83825019c22d8f3aa0b223ca"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.2.0/dot-ai-darwin-amd64"
      sha256 "8d52a08d93f55e58c38a53a25f69008a49aef72aae2f83bf199941e258bb6daf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.2.0/dot-ai-linux-arm64"
      sha256 "30811ad1f154f6708410c7bc6f120635fa8359c827e366b3d926551e756a1491"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.2.0/dot-ai-linux-amd64"
      sha256 "dec887e47ffe07c20884823eae53d2d9ea071ee5b35b4fcd8b218a2fa196823b"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
