class Aihki < Formula
  desc "Independent command-line client for Taiga"
  homepage "https://github.com/KoukeNeko/aihki"
  version "0.2.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.2.0/aihki_0.2.0_darwin_arm64.tar.gz"
      sha256 "d7bf3b6e2364b84d1b307a5a3d07b729dba5ffbbb09e6a2dee9a30b7e0414eb7"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.2.0/aihki_0.2.0_darwin_amd64.tar.gz"
      sha256 "d1563eb2a0d0fe93437a3801cc9f3403a3dbb8f0c5a4459d4cc42ffe88c79a52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.2.0/aihki_0.2.0_linux_arm64.tar.gz"
      sha256 "bdee95ad1e4aba4f9a9c8f735f24db5a4301b3e2007cfc56f6191069494dcb01"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.2.0/aihki_0.2.0_linux_amd64.tar.gz"
      sha256 "c9137832c1f4afdf95ac5b2e5d7ab21a7995a2a4b9c1547182466218e5dd1cad"
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
