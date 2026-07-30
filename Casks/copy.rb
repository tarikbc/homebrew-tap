cask "copy" do
  version "0.1.2"
  sha256 "b88f4c99b3b821901a25a05551516bb08f83b358983fb98a8e998224798875ec"

  url "https://github.com/tarikbc/Copy/releases/download/v#{version}/Copy-#{version}.dmg"
  name "Copy"
  desc "Visual shelf for your clipboard history"
  homepage "https://github.com/tarikbc/Copy"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Copy.app"

  zap trash: [
    "~/Library/Application Support/Copy",
    "~/Library/Caches/com.tarikbc.Copy",
    "~/Library/Preferences/com.tarikbc.Copy.plist",
    "~/Library/Saved Application State/com.tarikbc.Copy.savedState",
  ]

  caveats <<~EOS
    Copy is signed and notarized, so it opens without a Gatekeeper prompt.

    It needs Accessibility access to paste into other apps for you. On first
    launch it walks you through the grant, or enable it any time under:

      System Settings > Privacy & Security > Accessibility

    Summon the shelf with Shift-Command-V.
  EOS
end
