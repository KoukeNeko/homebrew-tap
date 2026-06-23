# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/Adding-Software-to-Homebrew#cask-stanzas
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "finderhover" do
  version "1.9.0"
  sha256 "2c3603acabc5b5cc669b735be48651fdf90d16494b9ca94bab460ca47ffbbfe1"

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

  # Clear the cached GitHub contributors list on install so the in-app About page
  # refetches a fresh list (a one-time stale cache used to hide new contributors).
  postflight do
    system_command "/bin/sh",
                   args: ["-c", "/usr/bin/defaults delete dev.koukeneko.FinderHover cachedContributors >/dev/null 2>&1; exit 0"]
  end

  uninstall quit: "dev.koukeneko.FinderHover",
            script: {
              executable: "/bin/sh",
              args:       ["-c", "/usr/bin/defaults delete dev.koukeneko.FinderHover cachedContributors >/dev/null 2>&1; /usr/bin/tccutil reset Accessibility dev.koukeneko.FinderHover; exit 0"],
              sudo:       false,
            }

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: [
    "~/Library/Preferences/dev.koukeneko.FinderHover.plist",
  ]
end
