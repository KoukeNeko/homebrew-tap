cask "plaitway" do
  version "0.3.1"
  sha256 "c284920bd0357ea653298b8a3c2ad925b4b3cd11777151059b0b990631bc1711"

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
