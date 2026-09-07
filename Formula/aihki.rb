class Aihki < Formula
  desc "Independent command-line client for Taiga"
  homepage "https://github.com/KoukeNeko/aihki"
  version "0.5.1"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.5.1/aihki_0.5.1_darwin_arm64.tar.gz"
      sha256 "3963a83e099962a22a1778bbea997c1e6936a42af096f16a187a3a21dace44e3"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.5.1/aihki_0.5.1_darwin_amd64.tar.gz"
      sha256 "b14f48c10000bc4336d0fd21376eb8ed896d7155ce5186761a036a8227e33dad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.5.1/aihki_0.5.1_linux_arm64.tar.gz"
      sha256 "974a3ae001b7592a4b00d53b4dfadf105b4e73e1d9ea8af5c9f253ea047cfdd0"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.5.1/aihki_0.5.1_linux_amd64.tar.gz"
      sha256 "5ceb1951130bc5865e6b8347ade75a1b809b6de2f874293b2bc1d6a1d80c49e9"
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
