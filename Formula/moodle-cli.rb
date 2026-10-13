class MoodleCli < Formula
  desc "Independent Moodle command-line client for learners and educators"
  homepage "https://github.com/KoukeNeko/Moodle-CLI"
  version "0.4.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.4.0/moodle-cli_0.4.0_darwin_arm64.tar.gz"
      sha256 "b1c242b837945a7e85f88dad3cfc2867bc3788743ee9b6e57c6980e43a1f0540"
    end
    on_intel do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.4.0/moodle-cli_0.4.0_darwin_amd64.tar.gz"
      sha256 "09f5b5e1a34a4937a94f16629eba0910d8679ae6650e10d9381fb2594685de0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.4.0/moodle-cli_0.4.0_linux_arm64.tar.gz"
      sha256 "8cd8659ed361ece831ff07b96b28857b6652ba88af0b31c1fc17db9a9e627afe"
    end
    on_intel do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.4.0/moodle-cli_0.4.0_linux_amd64.tar.gz"
      sha256 "fb63916c6ed66a1c39c442593ed3c1248a1e78c290b76f5289ed7a78efe4c997"
    end
  end

  def install
    bin.install "moodle"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/moodle version")
    assert_match '"schema_version":1', shell_output("#{bin}/moodle version --json")
  end
end
