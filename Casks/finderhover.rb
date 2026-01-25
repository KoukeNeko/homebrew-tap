# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/Adding-Software-to-Homebrew#cask-stanzas
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "finderhover" do
  version "1.4.1"
  sha256 "104fc9a7ce29654225a3e558b3a27296080604769598420a0de95bddea75c423"

  url "https://github.com/KoukeNeko/FinderHover/releases/download/v#{version}/FinderHover.app.zip"
  name "FinderHover"
  desc "Show file information on hover in Finder"
  homepage "https://github.com/KoukeNeko/FinderHover"

  # Documentation: https://docs.brew.sh/Brew-Livecheck
  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "FinderHover.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/FinderHover.app"]
  end

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: [
    "~/Library/Preferences/dev.koukeneko.FinderHover.plist",
  ]
end
