class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.14.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.14.1/dot-ai-darwin-arm64"
      sha256 "0fa73523ab6b16fe47a53e4c4e4b03bd0b54bc282e625086eb222ef2511cf551"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.14.1/dot-ai-darwin-amd64"
      sha256 "f1e82ba26c1c6b84e9e6fa8dc9e98ef92bb2c1d1132417f7b472715e378d71c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.14.1/dot-ai-linux-arm64"
      sha256 "53a405214df17152cd86291fcb9ccd0fec550058f346d484e73682b636fc8815"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.14.1/dot-ai-linux-amd64"
      sha256 "e5da04e1352d253f3ae4d6255c471e09eae57a382e644e5c810f86d9e725c479"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
