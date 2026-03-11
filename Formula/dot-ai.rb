class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.8.1/dot-ai-darwin-arm64"
      sha256 "df5736c5fe595c9bf201327084964a26afbd50291d716861d9e564909f8d8a14"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.8.1/dot-ai-darwin-amd64"
      sha256 "e56e3ada26a8c9e6d32b63c00216098425157b3301110d52a1d180505f95477b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.8.1/dot-ai-linux-arm64"
      sha256 "c350c103fa2951901975a662df6b2d02f0799c4edab76374bbb52c08d90c494e"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.8.1/dot-ai-linux-amd64"
      sha256 "b2631ae4e903a2f7d3808d755548ba19da4e9b3070154e633e7fd22729997a31"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
