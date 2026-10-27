# Documentation: https://docs.brew.sh/Cask-Cookbook
cask "finderhover@beta" do
  version "1.10.0"
  sha256 "7805bf4529aee02b15c1bec7ade97804d587f07ab67d64496c0f646ef5fa9dfd"

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
