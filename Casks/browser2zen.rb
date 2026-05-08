cask "browser2zen" do
  version "1.2.2"
  sha256 "b5f5e101d9a8ef3d09bef0257d530b644f1e8f443ccabcd7530a6ac7efa56ab7"

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
