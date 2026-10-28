cask "plaitway" do
  version "0.7.0"
  sha256 "1eabb1819cc9a810cc764de4bfa4457c5fe2e8b9a1ea8c3a7edc3506f0cc1505"

  url "https://github.com/KoukeNeko/Plaitway/releases/download/v#{version}/Plaitway-#{version}.zip"
  name "Plaitway"
  desc "Run several OpenVPN and WireGuard VPNs at once from the menu bar"
  homepage "https://github.com/KoukeNeko/Plaitway"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Plaitway.app"
  binary "#{appdir}/Plaitway.app/Contents/Resources/bin/plaitway"

  uninstall quit: "io.github.koukeneko.plaitway"

  caveats <<~EOS
    Before uninstalling, choose Uninstall Helper… in Plaitway's Settings. Removing the app
    first can leave a root helper registered with nothing to stop it.
  EOS
end
