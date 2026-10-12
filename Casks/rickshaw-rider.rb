cask "rickshaw-rider" do
  version "1.1.0"
  sha256 "374d83c46cff36313375ac9033de55d07ee0815cd8b5b38f4c7916c2f77ae30c"

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
