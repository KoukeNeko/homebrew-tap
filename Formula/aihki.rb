class Aihki < Formula
  desc "Independent command-line client for Taiga"
  homepage "https://github.com/KoukeNeko/aihki"
  version "0.3.2"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.3.2/aihki_0.3.2_darwin_arm64.tar.gz"
      sha256 "1901342a24dcbb2e65cc9a131f437751f9d7372658422ae010093c11ab5e7a9b"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.3.2/aihki_0.3.2_darwin_amd64.tar.gz"
      sha256 "3d19b6c580c1046b834a6ee59ded7ae48c5d983323a6c6d0371286adb711d158"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.3.2/aihki_0.3.2_linux_arm64.tar.gz"
      sha256 "2de694e32b4f3c45ffbbddbbac38ae15030b9fe635e38e6c52c96cd0612f9912"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.3.2/aihki_0.3.2_linux_amd64.tar.gz"
      sha256 "71cf4440bc081635a8f04945efe7592f299b905b107e0a472336e0a7c2107427"
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
