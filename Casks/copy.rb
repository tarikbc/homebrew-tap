cask "copy" do
  version "0.1.3"
  sha256 "49283bc26afb24c0bd20ac9de49a5a1434a6a0cd4e577ff8a9899d3cbe7bf056"

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
