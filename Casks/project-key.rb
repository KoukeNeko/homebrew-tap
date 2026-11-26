cask "project-key" do
  version "0.12.2"
  sha256 "8c3b93d3d63eaa5798a730a56014c782d618a443cad23d825847023d9c828504"

  url "https://github.com/KoukeNeko/Project-Key/releases/download/v#{version}/ProjectKey-#{version}-macos.zip"
  name "Project Key"
  desc "Zhuyin input method"
  homepage "https://github.com/KoukeNeko/Project-Key"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  input_method "ProjectKey.app"

  postflight do
    app = "#{Dir.home}/Library/Input Methods/ProjectKey.app"
    # Ad-hoc signed and not notarized: Gatekeeper refuses it while quarantined.
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", app]
    system_command "#{app}/Contents/MacOS/ProjectKey", args: ["--register"]
    system_command "/usr/bin/open", args: ["-g", app]
  end

  uninstall quit: "org.projectkey.inputmethod.ProjectKey"

  caveats "Add Project Key in System Settings > Keyboard > Input Sources."
end
