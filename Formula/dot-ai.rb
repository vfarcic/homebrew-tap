class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.14.0/dot-ai-darwin-arm64"
      sha256 "52fde221444e4506c5ee6140b4f3ef1fcdbead1d847d72ffbad71785272e36c6"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.14.0/dot-ai-darwin-amd64"
      sha256 "083e14087f689451f6281116ac490a8d45a0ae1dcc03451b78349aa51abe51c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.14.0/dot-ai-linux-arm64"
      sha256 "de8d8433b903cee409d5ba710c11d6fcde86c9364e6111ca4053369606cc58e3"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.14.0/dot-ai-linux-amd64"
      sha256 "ce76c412173bc489549c61649628873ccd94d782daafa99cdbf4428f18473fcc"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
