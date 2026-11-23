cask "project-key" do
  version "0.10.1"
  sha256 "8a041a3c30b62ac05250a6fad94ab2274e01316bb04762050ce1124835e6a3b1"

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
