cask "sharecodex" do
  version "0.3.42"
  sha256 "dd49fd84245055c0f838000da3836fc3801120b4fb616105f3a7e3dc282ca448"

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
