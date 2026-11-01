cask "rickshaw-rider" do
  version "1.6.0"
  sha256 "0c35054588ef4482afff3eb0ab627b16e816e7411a47dee574599a0b20e131e2"

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
