class DotAi < Formula
  desc "CLI for the dot-ai Kubernetes AI assistant"
  homepage "https://github.com/vfarcic/dot-ai-cli"
  version "1.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.15.0/dot-ai-darwin-arm64"
      sha256 "547aa2858b6e0ef032da892069592d6f45210fdb8965ae1624e66edb625f9819"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.15.0/dot-ai-darwin-amd64"
      sha256 "4f8a275477f7472518116b8dc09ce047a55712bf50de454d2d211cf38f8e08c3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.15.0/dot-ai-linux-arm64"
      sha256 "77bc5f591cfb8532ca4fa98edd21eced110513f33165245e1df645a8621d2fa2"
    else
      url "https://github.com/vfarcic/dot-ai-cli/releases/download/1.15.0/dot-ai-linux-amd64"
      sha256 "05369daf6f8b485d022b75f3fc3aa2ae4d7a8cd49cc5f57e131774392010fedc"
    end
  end

  def install
    bin.install Dir["dot-ai-*"].first => "dot-ai"
  end

  test do
    assert_match "dot-ai", shell_output("#{bin}/dot-ai --help")
  end
end
