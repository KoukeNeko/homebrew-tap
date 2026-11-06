cask "project-key" do
  version "0.2.2"
  sha256 "4e9ec2774f1e6f5ea0ad933d7e6c492bcfe8528ee8b6140d5180136c500ae7b8"

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
