class MoodleCli < Formula
  desc "Independent Moodle command-line client for learners and educators"
  homepage "https://github.com/KoukeNeko/Moodle-CLI"
  version "0.2.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.2.0/moodle-cli_0.2.0_darwin_arm64.tar.gz"
      sha256 "4ebeea18c9025df040a186b9f5857e3e88d3632f46b82ffec8343cd1c707d4c6"
    end
    on_intel do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.2.0/moodle-cli_0.2.0_darwin_amd64.tar.gz"
      sha256 "28f19472f4ad4aa6bed33f738010eb650c3d8f2f047aa4c349b9a68cbb053748"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.2.0/moodle-cli_0.2.0_linux_arm64.tar.gz"
      sha256 "aac7b79f6d79a20497b05522edc377aad160a5fdc2c29f533c0e45bf1a835f02"
    end
    on_intel do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.2.0/moodle-cli_0.2.0_linux_amd64.tar.gz"
      sha256 "b4ff6b686efe2adccdab144587ff542692234ed819e09e1e28873e5eaee10ffa"
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
