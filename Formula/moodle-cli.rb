class MoodleCli < Formula
  desc "Independent Moodle command-line client for learners and educators"
  homepage "https://github.com/KoukeNeko/Moodle-CLI"
  version "0.2.1"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.2.1/moodle-cli_0.2.1_darwin_arm64.tar.gz"
      sha256 "005065ff4136d01af98251516bc9418f8a3869f379b50b655c887caa5d756736"
    end
    on_intel do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.2.1/moodle-cli_0.2.1_darwin_amd64.tar.gz"
      sha256 "82fc7bef11daf581496985a91cd96df6fd0e6949817b603df18ce2bace1e08b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.2.1/moodle-cli_0.2.1_linux_arm64.tar.gz"
      sha256 "79d0930c681c2fc698a0a60091512d6230a3fb818c43f42f973009d863d551a0"
    end
    on_intel do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.2.1/moodle-cli_0.2.1_linux_amd64.tar.gz"
      sha256 "81166af53990b30b13bca548cdf418ea17acf3a3e2247079dc17ed4ec0b17662"
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
