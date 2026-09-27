class Taiga < Formula
  desc "Independent command-line client for Taiga"
  homepage "https://github.com/KoukeNeko/taiga-cli"
  version "0.9.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/taiga-cli/releases/download/v0.9.0/taiga_0.9.0_darwin_arm64.tar.gz"
      sha256 "412f5197aa098ecf9847fb4591c445f9b708514348ab2f277d42c5522c4c56fd"
    end
    on_intel do
      url "https://github.com/KoukeNeko/taiga-cli/releases/download/v0.9.0/taiga_0.9.0_darwin_amd64.tar.gz"
      sha256 "7f66e1a4484e3d8a0ee3c95d6cc2380262661a62d3c864347240935beec3b4c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/taiga-cli/releases/download/v0.9.0/taiga_0.9.0_linux_arm64.tar.gz"
      sha256 "d061495d6664615229c7da18ff7ff2d56f106aa64535a621ffaf3aa72b304616"
    end
    on_intel do
      url "https://github.com/KoukeNeko/taiga-cli/releases/download/v0.9.0/taiga_0.9.0_linux_amd64.tar.gz"
      sha256 "b369072b9394bd7037c641fa4e0d224a93d345aef34ff1dc629b549634a1832c"
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
