class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.16.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.1/dot-ai-darwin-arm64"
      sha256 "e33ce5f9dd4f4bd11e0abb7f4f325bbd7d68f9ae2d0ff2616648aed85a2b57c1"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.1/dot-ai-darwin-amd64"
      sha256 "5688014227317ee31b20812620f9e37de745338dab958b8edd3cbd51f03f655c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.1/dot-ai-linux-arm64"
      sha256 "d480f28cad045557b7441beffdf27dbd268ce5430258b612f51cf1493c9e4c46"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.16.1/dot-ai-linux-amd64"
      sha256 "1e60c92798f2fae979128761837bb885054e79acc38f914546703bb6a9613acc"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
