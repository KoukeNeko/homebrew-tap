class MoodleCli < Formula
  desc "Independent Moodle command-line client for learners and educators"
  homepage "https://github.com/KoukeNeko/Moodle-CLI"
  version "0.1.1"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.1.1/moodle-cli_0.1.1_darwin_arm64.tar.gz"
      sha256 "b9f078071d208b45165855b712468158a579fa9b13f1dad112886077015ec8f7"
    end
    on_intel do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.1.1/moodle-cli_0.1.1_darwin_amd64.tar.gz"
      sha256 "adff6ea9c182d118aedd7c42a9166c1bc68c6a56a99b9b8317726046e07029c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.1.1/moodle-cli_0.1.1_linux_arm64.tar.gz"
      sha256 "fb8525fed012fe642a32dc2ae0082d6fd08796e40ce4e1441240528c109b3370"
    end
    on_intel do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.1.1/moodle-cli_0.1.1_linux_amd64.tar.gz"
      sha256 "dda1fa86e5e2c6a32eacded7bd99adb26eebb2e9632c2315a88d4a92be17de02"
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
