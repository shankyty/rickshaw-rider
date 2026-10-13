cask "rickshaw-rider" do
  version "1.3.1"
  sha256 "906dc5d94027615c0d1c7244d85c2c3e6f47b4d65b15f5e3dedc9cdcbc507f62"

  url "https://github.com/shankyty/rickshaw-rider/releases/download/v#{version}/RickshawRider.dmg"
  name "Rickshaw Rider"
  desc "Combat racer where you drive an auto-rickshaw through Indian cities"
  homepage "https://shankyty.github.io/rickshaw-rider/"

  depends_on macos: :ventura

  app "Rickshaw Rider.app"

  # The app is ad-hoc signed (not notarized); clear quarantine so it opens without a Gatekeeper prompt.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Rickshaw Rider.app"]
  end

  # The bundle id still says roadrash: the app's saves live under it.
  zap trash: [
    "~/Library/Saved Application State/com.shashanktyagi.roadrash-rickshaw.savedState",
    "~/Library/WebKit/com.shashanktyagi.roadrash-rickshaw",
  ]
end
