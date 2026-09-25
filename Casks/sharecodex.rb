cask "sharecodex" do
  version "0.2.2"
  sha256 "4e3ffbac223a5cb46558f0e271844e825f3fbccc38b9c7fd8027730850dac548"

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
