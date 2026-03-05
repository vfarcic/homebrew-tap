class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.3/dot-ai-darwin-arm64"
      sha256 "12c2072705777665951b9ae8a53f5ccd7b6ed5281e1d52a3de07aeeb7346a2c0"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.3/dot-ai-darwin-amd64"
      sha256 "4490cae80753bf3a80e76a9c5362fde3057a2b4cd870357b32c92a425476ef2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.3/dot-ai-linux-arm64"
      sha256 "b3f9d66291664e38928b004613311c96b9b65b4ed890230fc894c8b73cfd1255"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.6.3/dot-ai-linux-amd64"
      sha256 "a78c1adc5801e1f8ab9267ba367fcd36e541eba40209706ec655597e07b093c7"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
