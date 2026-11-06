# Documentation: https://docs.brew.sh/Cask-Cookbook
cask "finderhover@beta" do
  version "1.10.3"
  sha256 "d388b563538d6d349cc53e4021112ed7b6c214fa38c6735bd1aa45a17e8e7fe5"

  url "https://github.com/KoukeNeko/FinderHover/releases/download/v#{version}/FinderHover.app.zip"
  name "FinderHover (Beta)"
  desc "Show file information on hover in Finder"
  homepage "https://github.com/KoukeNeko/FinderHover"

  livecheck do
    url "https://github.com/KoukeNeko/FinderHover/releases?q=prerelease%3Atrue"
    regex(/v?(\d+(?:\.\d+)+(?:-beta\.\d+)?)/i)
    strategy :page_match
  end

  depends_on macos: :sonoma

  app "FinderHover.app"

  zap trash: "~/Library/Preferences/dev.koukeneko.FinderHover.plist"
end
