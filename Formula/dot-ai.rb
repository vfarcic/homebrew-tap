class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.21.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.21.1/dot-ai-darwin-arm64"
      sha256 "1e4a19921a1b3291b9abed768eae3b76052c6de65a83e215a8134f6f46fe4fae"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.21.1/dot-ai-darwin-amd64"
      sha256 "4fd13c769081fa48c6f3edc1a79e0c9bb1526b361c11985a6fb4b0a30a73eb86"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.21.1/dot-ai-linux-arm64"
      sha256 "0a97d8f38fdf13a51c2d8c3e29ffabac078ed53fba2d199e7d187d3cd74bdc34"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.21.1/dot-ai-linux-amd64"
      sha256 "9d71ccbd7c8d8fa672053c042157e12d1b96d8ab2d895a23bf6b6af0188a544b"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
