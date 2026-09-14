cask "browser2zen" do
  version "1.2.7"
  sha256 "119c1b39796476ee9e0d44807bf4f06fb875a3069a6a70a4aed88bd75e4d6a96"

  url "https://github.com/tarikbc/browser2zen/releases/download/v#{version}/browser2zen-#{version}-arm64.dmg"
  name "browser2zen"
  desc "Migrate workspaces, tabs, bookmarks, history, and cookies into Zen Browser"
  homepage "https://github.com/tarikbc/browser2zen"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"
  depends_on arch: :arm64

  app "browser2zen.app"

  zap trash: [
    "~/Library/Application Support/browser2zen",
    "~/Library/Caches/com.browser2zen.app",
    "~/Library/Preferences/com.browser2zen.app.plist",
    "~/Library/Saved Application State/com.browser2zen.app.savedState",
  ]

  caveats <<~EOS
    browser2zen is unsigned (no Apple developer cert for an OSS side
    project). On first launch macOS will ask you to confirm:

      System Settings > Privacy & Security > "Open Anyway"

    The app reads source-browser data and writes to your Zen profile
    locally; no network calls. Every step makes a timestamped backup.
  EOS
end
