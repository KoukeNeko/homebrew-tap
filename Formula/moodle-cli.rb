class MoodleCli < Formula
  desc "Independent Moodle command-line client for learners and educators"
  homepage "https://github.com/KoukeNeko/Moodle-CLI"
  version "0.1.2"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.1.2/moodle-cli_0.1.2_darwin_arm64.tar.gz"
      sha256 "39fca6baba95743a4e5571a0782d7a3f47094d77caa05440e7c99dbf9d42cda3"
    end
    on_intel do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.1.2/moodle-cli_0.1.2_darwin_amd64.tar.gz"
      sha256 "a90f497a6862de8f48b04ba8050a2cd1d427428d02ce178f5148a8a9b8c02b6a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.1.2/moodle-cli_0.1.2_linux_arm64.tar.gz"
      sha256 "328661eb558f6f3aa888616d1b5225956d3351325706f443339c99f3a99a332e"
    end
    on_intel do
      url "https://github.com/KoukeNeko/Moodle-CLI/releases/download/v0.1.2/moodle-cli_0.1.2_linux_amd64.tar.gz"
      sha256 "64be163cf5378b0eacab6b7fd130217c754336bb9fe4bed87d8ccb95216645ed"
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
