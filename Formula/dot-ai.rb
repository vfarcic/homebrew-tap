class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.16.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.2/dot-ai-darwin-arm64"
      sha256 "4628df17618c75e78d19f448911e0048688c22e752ea7b294ed578f59c731ae3"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.2/dot-ai-darwin-amd64"
      sha256 "dfe3c19bac46d876cfc6c6029142184e68b080676d9ee46e770a469490d18cdc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.2/dot-ai-linux-arm64"
      sha256 "6a721964b8a9699a68ac8ebe749a1fc6723f5cd4f900ed146ee664c240b6f60a"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.2/dot-ai-linux-amd64"
      sha256 "dff4c7416eaae565887ec6f9d911397b026a304dcaa65d48bfdf1db535c7aff0"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
