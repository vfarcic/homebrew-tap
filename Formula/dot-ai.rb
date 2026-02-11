class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.1.0/dot-ai-darwin-arm64"
      sha256 "c812664d804060de66d637d5572a30397533f860528e4e07632f30b62aba5d96"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.1.0/dot-ai-darwin-amd64"
      sha256 "1f265818376d6c2b9f441b25d6a4ad18019392280233336e13fce5738a255580"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.1.0/dot-ai-linux-arm64"
      sha256 "6935653497a6bb56043077169d0258e9807003afecea4b9d2860e603bd0ac3f2"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.1.0/dot-ai-linux-amd64"
      sha256 "d12fbc5e5695538d325d2d26d393bde0fca12fd54a391487f3f7b17032dc0885"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
