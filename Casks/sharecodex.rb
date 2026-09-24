cask "sharecodex" do
  version "0.2.0"
  sha256 "e1097377861551f8f15b674bbdced692358b0595e00094006264e89c5f124eed"

  url "https://github.com/KoukeNeko/ShareCodex/releases/download/v#{version}/ShareCodex-macos-universal.zip"
  name "ShareCodex"
  desc "Track shared Claude Code and Codex subscription quota"
  homepage "https://github.com/KoukeNeko/ShareCodex"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "ShareCodex.app"

  uninstall launchctl: "io.github.koukeneko.sharecodex",
            quit:      "io.github.koukeneko.sharecodex"

  zap trash: [
    "~/Library/Application Support/ShareCodex",
    "~/Library/LaunchAgents/io.github.koukeneko.sharecodex.plist",
  ]
end
