cask "tat-ccu" do
  version "0.1.1"
  sha256 "07bc6c3d2fb4c480e652c182e275dc56acf1d33a157bc4da7de901b5ffbff527"

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
