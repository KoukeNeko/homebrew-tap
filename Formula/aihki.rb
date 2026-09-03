class Aihki < Formula
  desc "Independent command-line client for Taiga"
  homepage "https://github.com/KoukeNeko/aihki"
  version "0.4.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.4.0/aihki_0.4.0_darwin_arm64.tar.gz"
      sha256 "2d06327468be7d7c6ae72a680721ad7244efba48d36cff24f01682f9932fba8b"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.4.0/aihki_0.4.0_darwin_amd64.tar.gz"
      sha256 "d935619ae20fc99f69f6d998e66a3fecde9d47fdc2072853f3442d213b94abe1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.4.0/aihki_0.4.0_linux_arm64.tar.gz"
      sha256 "3ac5c66086e74299b4db2037e0e7eae0b22b3980b02067ca896da0d516f75aac"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.4.0/aihki_0.4.0_linux_amd64.tar.gz"
      sha256 "41e0de8c895a77818ec93e66214b94da36b27bd3c677f3a21d871052d45bf791"
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
