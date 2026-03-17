class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.11.0/dot-ai-darwin-arm64"
      sha256 "683e4e8a36edb1178f8d3d6806e886b914435f3071d111e62fb97d237c7a5e4c"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.11.0/dot-ai-darwin-amd64"
      sha256 "88dfa7c3de8d6ed9df7661f1c7ff8204f12efd5c21685e5d6d9cc3eb8d346e09"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.11.0/dot-ai-linux-arm64"
      sha256 "ec64a6f94e8bb52cfc785b6a2aff5ee008464be783bd420618de6f2bdab96b2f"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.11.0/dot-ai-linux-amd64"
      sha256 "04ed8921fc38d9ef6740af5e9fd1d82c55e90ea94fd66f51f9f2dacb989a4292"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
