# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/Adding-Software-to-Homebrew#cask-stanzas
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "finderhover" do
  version "1.10.3"
  sha256 "d388b563538d6d349cc53e4021112ed7b6c214fa38c6735bd1aa45a17e8e7fe5"

  url "https://github.com/KoukeNeko/FinderHover/releases/download/v#{version}/FinderHover.app.zip"
  name "FinderHover"
  desc "Show file information on hover in Finder"
  homepage "https://github.com/KoukeNeko/FinderHover"

  # Documentation: https://docs.brew.sh/Brew-Livecheck
  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "FinderHover.app"

  uninstall quit:   "dev.koukeneko.FinderHover",
            script: {
              executable: "/bin/sh",
              args:       ["-c",
                           "/usr/bin/defaults delete dev.koukeneko.FinderHover " \
                           "cachedContributors >/dev/null 2>&1; " \
                           "/usr/bin/tccutil reset Accessibility " \
                           "dev.koukeneko.FinderHover; exit 0"],
              sudo:       false,
            }

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: "~/Library/Preferences/dev.koukeneko.FinderHover.plist"
end
