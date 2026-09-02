class Aihki < Formula
  desc "Independent command-line client for Taiga"
  homepage "https://github.com/KoukeNeko/aihki"
  version "0.2.1"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.2.1/aihki_0.2.1_darwin_arm64.tar.gz"
      sha256 "e3ac0126cdd50081290874189aff4f1ea86cd982e54632d9061288c3083eaac1"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.2.1/aihki_0.2.1_darwin_amd64.tar.gz"
      sha256 "7b03a92df946ab1dea0a0c5a6b0e0d1f2ab2441bf2149d01cdf4696d1abf490e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.2.1/aihki_0.2.1_linux_arm64.tar.gz"
      sha256 "4850b380483404f78e799a4dc5732eb5dd8113cbc7fcb4fc44e8a6e40ef1c625"
    end
    on_intel do
      url "https://github.com/KoukeNeko/aihki/releases/download/v0.2.1/aihki_0.2.1_linux_amd64.tar.gz"
      sha256 "4a6b0b61e2e2bc205c7342a5c927ff89c920dcd1a331c01742a9e83ca2729771"
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
