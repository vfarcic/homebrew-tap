class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.18.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.18.1/dot-ai-darwin-arm64"
      sha256 "d67c88200288dc4b7cb9a4dd6609b94bd5974e911377637b7e6db952e30322bd"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.18.1/dot-ai-darwin-amd64"
      sha256 "f0a1ebf858915b8aaa4331cb1db27fd42bd00c7d7d15c6a8aa9353ac8fa4df76"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.18.1/dot-ai-linux-arm64"
      sha256 "0b380092fd3f9802233d6a600451350100c5bdd799b5a357c934f44e4dc3834c"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.18.1/dot-ai-linux-amd64"
      sha256 "ba4029e5eb7058b02beff29c0106c83a4eb289d64969463aa16032dc613bacd8"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
