cask "plaitway" do
  version "0.3.4"
  sha256 "bfc27cb4891674b251d7d456089ababb5cbc3c9182bcce230844fab808f8b651"

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
