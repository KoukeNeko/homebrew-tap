class Aihki < Formula
  desc "Independent command-line client for Taiga"
  homepage "https://github.com/KoukeNeko/aihki"
  version "0.3.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.3.0/aihki_0.3.0_darwin_arm64.tar.gz"
      sha256 "897251a40fcd090ebcda87e035d56fcb0019ba8dcb0296547183f4fedf57802e"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.3.0/aihki_0.3.0_darwin_amd64.tar.gz"
      sha256 "a27ce02e66edc9f0d5556353605a2ad3a393654a6149c87be127bf40b1e5fbd2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.3.0/aihki_0.3.0_linux_arm64.tar.gz"
      sha256 "1829eee911c339dfb0643397cae75c8568b5441d9f67e1598b867e7ec7e99d44"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.3.0/aihki_0.3.0_linux_amd64.tar.gz"
      sha256 "99f6bec7adeff7e2b80a57f0018f6dcc8e2ef7a55d801fda36ff2a742ea3491f"
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
