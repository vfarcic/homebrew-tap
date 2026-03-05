class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.1/dot-ai-darwin-arm64"
      sha256 "455806271842453287459eb75ce65b396b05755c4eb367bb3024bb19bc501937"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.1/dot-ai-darwin-amd64"
      sha256 "6d3340e3e203d2099b9530d64c58db2ddf0769767f7cb3af5c8dd576453ae858"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.1/dot-ai-linux-arm64"
      sha256 "9176e5a25a775266b58a4ec64eae1d99c6b832104bf7793946ddc51009621578"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.1/dot-ai-linux-amd64"
      sha256 "ed53f72c766758d0601c7df85705aea4ec16291b6259f1804fcafc9aedea3a58"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
