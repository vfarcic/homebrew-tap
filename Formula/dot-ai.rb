class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.15.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.15.1/dot-ai-darwin-arm64"
      sha256 "63cac4f14a72f74b998d22379572ae074e1e20c92f38360cc1e44515d6a8233f"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.15.1/dot-ai-darwin-amd64"
      sha256 "fcb66dba015a2e10f8669cb7773fa0aced4e6b4da649876640a1d89fdf6d8ef5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.15.1/dot-ai-linux-arm64"
      sha256 "5cfaa73b5ba46e4732945c6e2cd6f6dd18d8081fde2f2546df06a09c4a32d306"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.15.1/dot-ai-linux-amd64"
      sha256 "aead357d683d531be6d9b23dbc3424daedab5b0b06911b01eb207edf9ce06c4f"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
