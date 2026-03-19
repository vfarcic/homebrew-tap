class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.11.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.11.1/dot-ai-darwin-arm64"
      sha256 "0c744b68613308ea49c436eb72d9d611573ba376091c7fb694cf6c1f3a20c136"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.11.1/dot-ai-darwin-amd64"
      sha256 "18b176b06e4af10592547ab77c59fda7e59f12dc3a9a346342f4c126ef74d5d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.11.1/dot-ai-linux-arm64"
      sha256 "efb137a1f346e1fa995328c07f89bfe69608af6ed0f9bb0db16182f06147030f"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.11.1/dot-ai-linux-amd64"
      sha256 "91132b735227e23b2d1120412aa89d4eeff65aa239318bfb85d7eed169f2e632"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
