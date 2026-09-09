class Taiga < Formula
  desc "Independent command-line client for Taiga"
  homepage "https://github.com/KoukeNeko/taiga-cli"
  version "0.6.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/taiga-cli/releases/download/v0.6.0/taiga_0.6.0_darwin_arm64.tar.gz"
      sha256 "9f8db9c510b4dbc6fd589626a676443a3db833a64d8943a30d4b86cf049df11b"
    end
    on_intel do
      url "https://github.com/KoukeNeko/taiga-cli/releases/download/v0.6.0/taiga_0.6.0_darwin_amd64.tar.gz"
      sha256 "34bf3f7cd3e996db5a7553a2b86170fb6b809fe4d75a2a714b9626038f28eb40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/taiga-cli/releases/download/v0.6.0/taiga_0.6.0_linux_arm64.tar.gz"
      sha256 "3eea74f0f23e55de0cae8877706e06b2cfc857a849e0c2613d34117ab47ed814"
    end
    on_intel do
      url "https://github.com/KoukeNeko/taiga-cli/releases/download/v0.6.0/taiga_0.6.0_linux_amd64.tar.gz"
      sha256 "21d9456d46df3ff13671c10f97ed1ba6569dfd7baec559a4ffa33c84f1811646"
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
