class MoodleCli < Formula
  desc "Independent Moodle command-line client for learners and educators"
  homepage "https://github.com/KoukeNeko/Moodle-CLI"
  version "0.1.3"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.1.3/moodle-cli_0.1.3_darwin_arm64.tar.gz"
      sha256 "6a032eefc307d1a37e152c21585f7ae9998612f87464b666a8a529156f729b70"
    end
    on_intel do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.1.3/moodle-cli_0.1.3_darwin_amd64.tar.gz"
      sha256 "ae3613e959161c6c21248d7ae79101f54e7bbc9954746e3c157266cbb9fcf124"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.1.3/moodle-cli_0.1.3_linux_arm64.tar.gz"
      sha256 "fe7ac68c5b09c1103eb6e6beeb62dcc311b7c956f6ac3f759416b02f7658d0da"
    end
    on_intel do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.1.3/moodle-cli_0.1.3_linux_amd64.tar.gz"
      sha256 "740d6e7c09a2dc8261fc4bbd7911b7dd2f063d34ccd83076b133f98b12b103dd"
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
