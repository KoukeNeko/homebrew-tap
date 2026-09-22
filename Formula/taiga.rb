class Taiga < Formula
  desc "Independent command-line client for Taiga"
  homepage "https://github.com/KoukeNeko/taiga-cli"
  version "0.8.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/taiga-cli/releases/download/v0.8.0/taiga_0.8.0_darwin_arm64.tar.gz"
      sha256 "0240b799a9202e5fa28ce03a76c862386262b14b7199090188fda04a51ccdbd3"
    end
    on_intel do
      url "https://github.com/KoukeNeko/taiga-cli/releases/download/v0.8.0/taiga_0.8.0_darwin_amd64.tar.gz"
      sha256 "fb8a3221b25b7a01e6278b1bb2fd0c3c0059afc976cb8bc307859c8c0c34ed56"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/taiga-cli/releases/download/v0.8.0/taiga_0.8.0_linux_arm64.tar.gz"
      sha256 "f0ca917b0414f122e55aca5073617ca04845d3456979cf8a9b74a7c9eabac04d"
    end
    on_intel do
      url "https://github.com/KoukeNeko/taiga-cli/releases/download/v0.8.0/taiga_0.8.0_linux_amd64.tar.gz"
      sha256 "4b501026bebec1608c130270328b4977a959742f4f520f3bb62fdc41380562e6"
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
