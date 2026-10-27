cask "tat-ccu" do
  version "0.1.11"
  sha256 "32bebc9474621c47ab545b81734c95d74b118a1aa0c6be500a06b266a10024ba"

  url "https://github.com/KoukeNeko/TAT-CCU/releases/download/v#{version}/TAT-CCU-#{version}-macos.zip"
  name "TAT CCU"
  desc "Timetable, eCourse2 and campus services of National Chung Cheng University"
  homepage "https://github.com/KoukeNeko/TAT-CCU"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "TAT CCU.app"

  uninstall quit: "io.github.koukeneko.tatCcu"

  zap trash: [
    "~/Library/Application Support/io.github.koukeneko.tatCcu",
    "~/Library/Containers/io.github.koukeneko.tatCcu",
  ]
end
