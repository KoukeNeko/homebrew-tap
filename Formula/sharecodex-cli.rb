class SharecodexCli < Formula
  desc "Track shared Claude Code and Codex subscription quota"
  homepage "https://github.com/KoukeNeko/ShareCodex"
  version "0.2.2"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :linux

  if Hardware::CPU.arm?
    url "https://github.com/KoukeNeko/ShareCodex/releases/download/v#{version}/sharecodex-linux-arm64.tar.gz"
    sha256 "d737fcfc42b0ba47c9b8ff6b0d9127377db7087ca29ec6a5b6fa6ac12f8de70d"
  else
    url "https://github.com/KoukeNeko/ShareCodex/releases/download/v#{version}/sharecodex-linux-amd64.tar.gz"
    sha256 "8349d216be14edb07177a0010af62c8a6aa55837067aafe0bb0f30a38a4a7026"
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
