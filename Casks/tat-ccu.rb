cask "tat-ccu" do
  version "0.1.9"
  sha256 "11b80b28625bde6479b7ae88a6b8f5acd5f14d42fd5b52c04f9cee9d13d9f1b0"

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
