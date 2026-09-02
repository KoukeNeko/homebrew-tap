class Aihki < Formula
  desc "Independent command-line client for Taiga"
  homepage "https://github.com/KoukeNeko/aihki"
  version "0.2.3"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.2.3/aihki_0.2.3_darwin_arm64.tar.gz"
      sha256 "1ca536745cc1e684dacf8601f64beabe7409e0f3ff0e72b018781116fb4f6f24"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.2.3/aihki_0.2.3_darwin_amd64.tar.gz"
      sha256 "d6ff6489b01cce43add31eeed800daa0e760ebb6fc27c34faff706418b33748f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.2.3/aihki_0.2.3_linux_arm64.tar.gz"
      sha256 "bacacebda01d6c977f46352c2a3a3ce6b8e4c6ce3bb89d8a0adc7d58f35145f0"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.2.3/aihki_0.2.3_linux_amd64.tar.gz"
      sha256 "a3ae36bd8802d9efecab112c711d30d385c6334ab05da790fc7fa090f7819cdd"
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
