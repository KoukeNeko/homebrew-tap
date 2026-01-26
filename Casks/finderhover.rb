# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/Adding-Software-to-Homebrew#cask-stanzas
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "finderhover" do
  version "1.6.6"
  sha256 "3da35f917aa57791ef6661bbfc2bd62cf67e6a525ef9f06310d2da2d99000c32"

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

  uninstall quit: "dev.koukeneko.FinderHover",
            script: {
              executable: "/usr/bin/tccutil",
              args:       ["reset", "Accessibility", "dev.koukeneko.FinderHover"],
              sudo:       false,
            }

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: [
    "~/Library/Preferences/dev.koukeneko.FinderHover.plist",
  ]
end
