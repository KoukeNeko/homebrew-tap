class MoodleCli < Formula
  desc "Independent Moodle command-line client for learners and educators"
  homepage "https://github.com/KoukeNeko/Moodle-CLI"
  version "0.3.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.3.0/moodle-cli_0.3.0_darwin_arm64.tar.gz"
      sha256 "97207cbe050d97f024212bdb95e54e6df92774364bc2c2fdd05eb9f3a5173e27"
    end
    on_intel do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.3.0/moodle-cli_0.3.0_darwin_amd64.tar.gz"
      sha256 "db9a42ddadea9ae35c6347053b2a98e3ae1a2a34a4abf8802ae173e7d6152b66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.3.0/moodle-cli_0.3.0_linux_arm64.tar.gz"
      sha256 "9544a76ff7ef9e7181dd6335ce6873c025453c306d050baa9edc9ca1a582d9f0"
    end
    on_intel do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.3.0/moodle-cli_0.3.0_linux_amd64.tar.gz"
      sha256 "bad294fbdfa9fa80c61697641bff120b716763df1a4361b43595ec3082538ef1"
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
