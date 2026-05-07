cask "browser2zen" do
  version "1.1.0"
  sha256 "a07000690dd4bfcec11806da58e566d30b41ae437ddb9c26493a4420edff3cf8"

  url "https://github.com/tarikbc/browser2zen/releases/download/v#{version}/browser2zen-#{version}-arm64.dmg"
  name "browser2zen"
  desc "Migrate workspaces, tabs, bookmarks, history, and cookies into Zen Browser"
  homepage "https://github.com/tarikbc/browser2zen"

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
    browser2zen is unsigned (no $99/year Apple developer cert for an OSS
    side project). The first time you launch it, macOS will ask you to
    confirm:

      System Settings -> Privacy & Security -> "Open Anyway"

    After that one prompt the app launches normally on subsequent runs.

    browser2zen never connects to the network. It reads bookmarks /
    history / cookies from your source browser locally and writes them
    into your Zen profile. Every step makes a timestamped backup beside
    your Zen profile, restorable from inside the app.
  EOS
end
