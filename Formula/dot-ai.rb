class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.9.1/dot-ai-darwin-arm64"
      sha256 "347d21d21286ab246e255066d9252580e5d2d62136ae7790eb31b4f9032f1f81"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.9.1/dot-ai-darwin-amd64"
      sha256 "4753292c3ff7295d0ed81bc51eef84d43d43fbe09b228eee503294861460ec55"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.9.1/dot-ai-linux-arm64"
      sha256 "3577a6a1e08cd1f678e03b7cf017a5e344f1eed6115a6a8c521b03f29a784023"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.9.1/dot-ai-linux-amd64"
      sha256 "e390322d65bb77a7ea16a4b908e18907b80f09bdc40d7d586205a2cd6cb06d40"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
