# Documentation: https://docs.brew.sh/Cask-Cookbook
cask "finderhover@beta" do
  version "1.10.0-beta.1"
  sha256 "d40bbdcd3fcab8f859e93fae6fc67f2b08c3af79a94387dd6b91b54d68c3a2e9"

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
