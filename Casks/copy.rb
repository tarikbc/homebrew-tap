cask "copy" do
  version "0.3.0"
  sha256 "59ebd00e89c7735d919955be4fdd6510e1e9dcde46ec1db8df8486c3f1882d13"

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
