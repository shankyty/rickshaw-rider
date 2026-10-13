cask "rickshaw-rider" do
  version "1.4.1"
  sha256 "bf3b1523a330ed8eb31d77027cd3a31f5447490a60f7c589730334c03aefdedd"

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
