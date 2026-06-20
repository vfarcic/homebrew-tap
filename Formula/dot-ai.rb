class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.23.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.23.0/dot-ai-darwin-arm64"
      sha256 "bfe1b1514a1c51050813a195a25370917b3850b84d843ce5167e6daa3a5dc54d"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.23.0/dot-ai-darwin-amd64"
      sha256 "2b50eb1b37e7b13b6c87ac84c9cc9239d57fd365ba67682df815ab324eea411d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.23.0/dot-ai-linux-arm64"
      sha256 "4146c352fece08f6de2aa2598a96be0d3962a4ba2e2171c88078c5b7744481ee"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.23.0/dot-ai-linux-amd64"
      sha256 "7fd76b461979debd6391f8b69476b854bd2d0badd3da80d2d2e51567d5328d3d"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
