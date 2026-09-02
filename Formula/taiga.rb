class Taiga < Formula
  desc "Command-line tool for Taiga projects"
  homepage "https://github.com/KoukeNeko/Taiga-CLI"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/Taiga-CLI/releases/download/v0.1.0/taiga_0.1.0_darwin_arm64.tar.gz"
      sha256 "7591928d897b59b1a94027bd2942b66922d7fe9e0dd338ed853b6f65c8fdfd2d"
    end
    on_intel do
      url "https://github.com/KoukeNeko/Taiga-CLI/releases/download/v0.1.0/taiga_0.1.0_darwin_amd64.tar.gz"
      sha256 "c5fbcede61f151511faa01d0afd25c1b01aaae46f9f7a9314bc65c5f16504431"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/Taiga-CLI/releases/download/v0.1.0/taiga_0.1.0_linux_arm64.tar.gz"
      sha256 "587af76702c0ae2e3a2e7ae96ec5c17831ab13d7bc79f803b901f3ecc967a1ef"
    end
    on_intel do
      url "https://github.com/KoukeNeko/Taiga-CLI/releases/download/v0.1.0/taiga_0.1.0_linux_amd64.tar.gz"
      sha256 "7076071465930cfb15490c805017b9199273c66bf4ba70e60ebe3afac89aa71f"
    end
  end

  def install
    bin.install "taiga"
    bash_completion.install "completions/taiga.bash" => "taiga"
    zsh_completion.install "completions/_taiga"
    fish_completion.install "completions/taiga.fish"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/taiga version")
    # A missing API URL is the documented validation failure, which proves the
    # binary runs and reports the structured contract rather than crashing.
    assert_match "missing_api_url", shell_output("#{bin}/taiga --json project list 2>&1", 7)
  end
end
