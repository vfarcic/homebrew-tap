class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "2.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.3.0/dot-ai-darwin-arm64"
      sha256 "73d4913257f2eeaacaf665892bba35b17774f442d32256a6da95ba18b3ae8033"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.3.0/dot-ai-darwin-amd64"
      sha256 "63a30ede2943fe2784d0251302394b7473f90640b59ffee6ebbaa1b2e5dcce89"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.3.0/dot-ai-linux-arm64"
      sha256 "2fbb27a78105a4809f9981b97ff31cd6764dff3567a27edd0aee17a13ff2c2f8"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.3.0/dot-ai-linux-amd64"
      sha256 "19a6867a712dbbb4b529afad0a746b3cf8b151478ea0213013b5578fd234855d"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
