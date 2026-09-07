class Aihki < Formula
  desc "Independent command-line client for Taiga"
  homepage "https://github.com/KoukeNeko/aihki"
  version "0.5.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.5.0/aihki_0.5.0_darwin_arm64.tar.gz"
      sha256 "aea1e371781e82dcd4e12e7820ceb0f272e87475030bbf398740398d6b703053"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.5.0/aihki_0.5.0_darwin_amd64.tar.gz"
      sha256 "6e4ce060a10b7cd5f21e9cada5c99e1bb4d115fb519aa4340dcedccf30cb45d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.5.0/aihki_0.5.0_linux_arm64.tar.gz"
      sha256 "d61ad29eb0f1963d8d37b507d3923e1e853ca6091e121119eb4d53b5b533181b"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.5.0/aihki_0.5.0_linux_amd64.tar.gz"
      sha256 "70bb1a0fc1447f43f0af12753f5134d61a1a98b14472c2e867d1cbfdb66389e9"
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
