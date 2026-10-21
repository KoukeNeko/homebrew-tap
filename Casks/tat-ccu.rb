cask "tat-ccu" do
  version "0.1.0"
  sha256 "b7fd3fc4d85848e050b4a504e414e962a6fa99b879fe093fe5db0279d18cdec6"

  url "https://github.com/KoukeNeko/TAT-CCU/releases/download/v#{version}/TAT-CCU-#{version}.zip"
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
