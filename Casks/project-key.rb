cask "project-key" do
  version "0.12.1"
  sha256 "0d7882f0d5c1ab11cdbd8217eb970e72c2760d24bfdc7df76028a4ec0481c447"

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
