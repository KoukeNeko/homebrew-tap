# Documentation: https://docs.brew.sh/Cask-Cookbook
cask "finderhover@beta" do
  version "1.10.2"
  sha256 "b552ae7db4495f983444e739b6f05172089ded12829a331a40abd27e4e13056e"

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
