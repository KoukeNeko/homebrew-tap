class Aihki < Formula
  desc "Independent command-line client for Taiga"
  homepage "https://github.com/KoukeNeko/aihki"
  version "0.3.1"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.3.1/aihki_0.3.1_darwin_arm64.tar.gz"
      sha256 "f7f2fe0b690606192884af8087b5aadc3c8ae0f2f5b6d72941169833cef0bd3a"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.3.1/aihki_0.3.1_darwin_amd64.tar.gz"
      sha256 "5ab08ad68645880187f93de72b69c63c3b38e4f6775ac49e8711286b746ba221"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.3.1/aihki_0.3.1_linux_arm64.tar.gz"
      sha256 "eb6f4f9813ecd95d42b882e0c55f3d01f73e687a858dafe489607bea2fd522fa"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.3.1/aihki_0.3.1_linux_amd64.tar.gz"
      sha256 "de68f996679f1f65a0a575a1be3bb3a14313f29d9aeb6194067f7867c9e3c7d7"
    end
  end

  def install
    bin.install "aihki"
    bash_completion.install "completions/aihki.bash" => "aihki"
    zsh_completion.install "completions/_aihki"
    fish_completion.install "completions/aihki.fish"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aihki version")
    # A missing API URL is the documented validation failure, which proves the
    # binary runs and reports the structured contract rather than crashing.
    assert_match "missing_api_url", shell_output("#{bin}/aihki --json project list 2>&1", 7)
  end
end
