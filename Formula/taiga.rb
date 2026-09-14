class Taiga < Formula
  desc "Independent command-line client for Taiga"
  homepage "https://github.com/KoukeNeko/taiga-cli"
  version "0.7.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/taiga-cli/releases/download/v0.7.0/taiga_0.7.0_darwin_arm64.tar.gz"
      sha256 "51f214ef1c6a958fb7d99c963490e0a802305437da531167a24f4a3b71803d60"
    end
    on_intel do
      url "https://github.com/KoukeNeko/taiga-cli/releases/download/v0.7.0/taiga_0.7.0_darwin_amd64.tar.gz"
      sha256 "92464e6f7a450b55155411b56819bf09340b4d44722d98ac2a8696710958073f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/taiga-cli/releases/download/v0.7.0/taiga_0.7.0_linux_arm64.tar.gz"
      sha256 "757ed02e0f2c3dbef1d6f71594868452a6eea854e5cb75329d8ba2876947ed2e"
    end
    on_intel do
      url "https://github.com/KoukeNeko/taiga-cli/releases/download/v0.7.0/taiga_0.7.0_linux_amd64.tar.gz"
      sha256 "91adb19de7c326fe4049d80cabd37b34597b2dd064a02e5d5d5a44d885059022"
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
