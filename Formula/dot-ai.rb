class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.12.0/dot-ai-darwin-arm64"
      sha256 "f85877e27e17082ea735ee09a4c0daef3635e33e626c02b7c9e6905f98db1209"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.12.0/dot-ai-darwin-amd64"
      sha256 "4f0624d353b6f4cc267d7aded30c08cd17e993016671b5e22251918c813f1b75"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.12.0/dot-ai-linux-arm64"
      sha256 "851912081a3c329a7a415800a54d19971698632adfca26df1695508c2d517488"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.12.0/dot-ai-linux-amd64"
      sha256 "296ea0b7cf87b8768092b227d31791905e17fa3f67848623b19e89f1b0ca445b"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
