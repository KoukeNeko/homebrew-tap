class SharecodexCli < Formula
  desc "Track shared Claude Code and Codex subscription quota"
  homepage "https://github.com/KoukeNeko/ShareCodex"
  version "0.3.51"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :linux

  if Hardware::CPU.arm?
    url "https://github.com/KoukeNeko/ShareCodex/releases/download/v#{version}/sharecodex-linux-arm64.tar.gz"
    sha256 "fc70d5abfd28abc32e70598ba2d7ea4edc90ec4aca04c6944c8bbb2447a4f3d4"
  else
    url "https://github.com/KoukeNeko/ShareCodex/releases/download/v#{version}/sharecodex-linux-amd64.tar.gz"
    sha256 "415da24dd28488de15d6894eb5ddd3516d5420704a494dfeb7b809648f33bac8"
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
