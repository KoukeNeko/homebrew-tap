class Aihki < Formula
  desc "Independent command-line client for Taiga"
  homepage "https://github.com/KoukeNeko/aihki"
  version "0.2.2"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.2.2/aihki_0.2.2_darwin_arm64.tar.gz"
      sha256 "940e5aa833b8e3e44fd5eb0cb4695518cfffcf90e8ae765fdb210b1d4f3f9a30"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.2.2/aihki_0.2.2_darwin_amd64.tar.gz"
      sha256 "05068788903e790addb1ef9524990dfc29d1b32af39b877beaa2a5a63b400732"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.2.2/aihki_0.2.2_linux_arm64.tar.gz"
      sha256 "ec3ece627ca75ce2cfceb02660037977fae249ac9ac87fcb50eaee6ef04c681a"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.2.2/aihki_0.2.2_linux_amd64.tar.gz"
      sha256 "865ec59fb93c5e37884e2e05264875b0d0b9d68f9d71c02ecdf4ea60ed160866"
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
