# Documentation: https://docs.brew.sh/Cask-Cookbook
cask "kouke-browser" do
  version "1.0"
  sha256 :no_check # Update with actual sha256 after first release

  url "https://github.com/KoukeNeko/kouke-browser/releases/download/v#{version}/Kouke-Browser.app.zip"
  name "Kouke Browser"
  desc "A minimal, fast web browser for macOS"
  homepage "https://github.com/KoukeNeko/kouke-browser"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "kouke browser.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/kouke browser.app"]
  end

  zap trash: [
    "~/Library/Preferences/dev.doeshing.kouke-browser.plist",
  ]
end
