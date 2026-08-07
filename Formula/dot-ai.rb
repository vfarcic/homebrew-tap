class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.0.0/dot-ai-darwin-arm64"
      sha256 "464ee1c7ef6fa37a0af0583f0ccbdb983222a31954e883a506d565a055b5558c"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.0.0/dot-ai-darwin-amd64"
      sha256 "6ca429c27b54a1435923b34a518bcee7e13d527677bfce886377854469c4c023"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.0.0/dot-ai-linux-arm64"
      sha256 "b7ac97163066195c4d7cfc5edfb89fe4ad0fd156c5414b96cce72b3fb52b770f"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/2.0.0/dot-ai-linux-amd64"
      sha256 "46e074825c21c87fe3a42d2817375edb6a65b683c8de2394875591c67dd5589d"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
