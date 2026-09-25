cask "sharecodex" do
  version "0.2.1"
  sha256 "b8dd215d834292caf8822374d0d2dfe6f32c6966f11649bb0e6783929ba78b05"

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
