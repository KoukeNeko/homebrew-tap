class SharecodexCli < Formula
  desc "Track shared Claude Code and Codex subscription quota"
  homepage "https://github.com/KoukeNeko/ShareCodex"
  version "0.3.61"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :linux

  if Hardware::CPU.arm?
    url "https://github.com/KoukeNeko/ShareCodex/releases/download/v#{version}/sharecodex-linux-arm64.tar.gz"
    sha256 "741453cc10f58d00b6336f927eba0dcc075bafdc8ee25eb7b4c6b1843f721c7e"
  else
    url "https://github.com/KoukeNeko/ShareCodex/releases/download/v#{version}/sharecodex-linux-amd64.tar.gz"
    sha256 "42043773ad6bfaa1eaf1bf9e24190609d341b02a0669aeedd75e63f0d1a84535"
  end

  def install
    bin.install "sharecodex"
  end

  def caveats
    <<~EOS
      If you turned on autostart, restart the agent after upgrading:
        sharecodex autostart on
    EOS
  end

  test do
    assert_match "usage:", shell_output("#{bin}/sharecodex help 2>&1", 1)
  end
end
