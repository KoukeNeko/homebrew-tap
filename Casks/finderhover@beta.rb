# Documentation: https://docs.brew.sh/Cask-Cookbook
cask "finderhover@beta" do
  version "1.10.1"
  sha256 "8e00a907438dec8c2d993b1f3bab828bc000f289611186589c38435b2ee2b58c"

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
