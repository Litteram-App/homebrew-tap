cask "litteram" do
  version "0.9.5"
  sha256 "a1a8fae733c7167346016eb6b90d587ce407d49156001aa6abeed15428c4016a"

  url "https://github.com/Litteram-App/litteram-app.github.io/releases/download/v#{version}/Litteram.zip"
  name "Litteram"
  desc "Native Markdown editor with live preview"
  homepage "https://litteram-app.github.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Litteram.app"

  # Litteram is signed for local use only (no Developer ID): without this,
  # macOS would block the first launch until "Open Anyway".
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Litteram.app"]
  end

  zap trash: [
    "~/Library/Caches/com.litteram.app",
    "~/Library/HTTPStorages/com.litteram.app",
    "~/Library/Preferences/com.litteram.app.plist",
    "~/Library/Saved Application State/com.litteram.app.savedState",
  ]
end
