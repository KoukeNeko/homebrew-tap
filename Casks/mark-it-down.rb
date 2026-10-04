cask "mark-it-down" do
  version "0.1.15"
  sha256 "bc51ab6247638cb3841ac381872df0522db3ddd02439f56c9fe35bab1cf6ad37"

  url "https://github.com/KoukeNeko/Mark-It-Down.workflow/releases/download/v#{version}/Mark-It-Down-#{version}.zip"
  name "Mark It Down"
  desc "Finder Quick Actions that convert files to Markdown with markitdown"
  homepage "https://github.com/KoukeNeko/Mark-It-Down.workflow"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "uv"

  service "Mark It Down - Copy to Clipboard.workflow"
  service "Mark It Down - Save as Markdown File.workflow"

  caveats <<~EOS
    markitdown is installed on first use (you will be asked to confirm).
    If the Quick Actions do not show up in Finder, enable them in:
      System Settings → Keyboard → Keyboard Shortcuts → Services → Files and Folders
  EOS
end
