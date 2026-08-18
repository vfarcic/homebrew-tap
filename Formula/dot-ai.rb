class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "2.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.2.1/dot-ai-darwin-arm64"
      sha256 "e43e94be3fac14cd6ccc76dfcf6f9373693f443ec8f2b8c1320247886789b704"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.2.1/dot-ai-darwin-amd64"
      sha256 "672afab0db2ac938680a88de7b6c8b9f8bd63add81a85624501bd8c697d89c81"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.2.1/dot-ai-linux-arm64"
      sha256 "8bc33a0a8d91a7a11f70f82839db6cd9a0ec7cfd4d74335878c72396d28959c4"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.2.1/dot-ai-linux-amd64"
      sha256 "dcb735088e65254221453794d722292af2154e4bb6928144bd89dd7e318740cb"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
