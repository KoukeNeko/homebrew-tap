cask "sharecodex" do
  version "0.3.5"
  sha256 "c1fc1275ce968f66742d978b73b7a9801466170b45ff025e4bb8b00686bfa9d5"

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
