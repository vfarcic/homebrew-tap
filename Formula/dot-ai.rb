class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.13.0/dot-ai-darwin-arm64"
      sha256 "e3438be79f3203e2bf254efb2fd805257f46f75695b5565b152248db4518f31d"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.13.0/dot-ai-darwin-amd64"
      sha256 "758c0f37834fcac282eaee60f122064d98782f8c6dea2c4cc61a0a28b4986633"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.13.0/dot-ai-linux-arm64"
      sha256 "c108974d4d54caf5fefc9f154915a2ef2a11955510035c9641f476ad52f46f61"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.13.0/dot-ai-linux-amd64"
      sha256 "ff17255b58d7d323c4384cf0f813ebe4eec5fa40982987b80f6ae688e143fe8a"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
