class SharecodexCli < Formula
  desc "Track shared Claude Code and Codex subscription quota"
  homepage "https://github.com/KoukeNeko/ShareCodex"
  version "0.3.55"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :linux

  if Hardware::CPU.arm?
    url "https://github.com/KoukeNeko/ShareCodex/releases/download/v#{version}/sharecodex-linux-arm64.tar.gz"
    sha256 "c9bcae779f4bbb416b313d7a70d6957992face06d1cc0e9ed160e12464132c87"
  else
    url "https://github.com/KoukeNeko/ShareCodex/releases/download/v#{version}/sharecodex-linux-amd64.tar.gz"
    sha256 "bc5c28b7213cb51e1d4b88b6773cf7e433863f94d91280e4ddff628af52f1118"
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
