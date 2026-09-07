class Aihki < Formula
  desc "Independent command-line client for Taiga"
  homepage "https://github.com/KoukeNeko/aihki"
  version "0.5.2"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.5.2/aihki_0.5.2_darwin_arm64.tar.gz"
      sha256 "ef1a5d22a7798848abb55abd6f739e0958cea236e8d854ce77b6d0f7c879dc0b"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.5.2/aihki_0.5.2_darwin_amd64.tar.gz"
      sha256 "40517cba6b3d7a9e96a7b1de8a2ba66438623abe7c0e58fc3c105746f5511de1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.5.2/aihki_0.5.2_linux_arm64.tar.gz"
      sha256 "99d64a6ca2144ab49a6f1b79ae7cf40ac27008e402dc3aa092f230945f633361"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.5.2/aihki_0.5.2_linux_amd64.tar.gz"
      sha256 "fee099ebad7d6ad0cb3f52043938ceecaf95a27388c59b5333ce2a89ae224cbd"
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
