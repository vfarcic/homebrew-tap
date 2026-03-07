class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.7.1/dot-ai-darwin-arm64"
      sha256 "31447d4a8230135ad023288caec7f325799e21c0bc1ec25144560d1efdaa5d8f"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.7.1/dot-ai-darwin-amd64"
      sha256 "9d246d9c7fc3b9c626021e8196152a589d17ae3727fde51d072f2a44ca6551e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.7.1/dot-ai-linux-arm64"
      sha256 "456261060849a231ca83b2bca1d041542c8632beaaded0490c8f2074d43e3418"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/v1.7.1/dot-ai-linux-amd64"
      sha256 "4b68f5bcc56d9b04277b872a4e971ce96c5aa283b91b4323ac53aa07a3c4a34d"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
