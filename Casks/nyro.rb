cask "nyro" do
  version "1.7.5"

  name "Nyro"
  desc "Local-first AI protocol gateway for OpenAI / Anthropic / Gemini"
  homepage "https://github.com/nyroway/nyro"

  on_macos do
    arch arm: "aarch64", intel: "x64"
    sha256 arm:   "ad066ee3adeb310a821df84682fc6c8912d0eca082fbcaa1be3fe85f21238912",
           intel: "a946b5e959bf4d6d33cc44e429d3828283833c8e3a44436907f79f047233bb61"

    url "https://github.com/nyroway/nyro/releases/download/v#{version}/Nyro_#{version}_#{arch}.dmg"

    app "Nyro.app"
    postflight do
      system_command "/usr/bin/xattr",
                     args: ["-rd", "com.apple.quarantine", "#{appdir}/Nyro.app"]
    end

    zap trash: [
      "~/Library/Application Support/com.nyro.ai-gateway",
      "~/Library/Caches/com.nyro.ai-gateway",
      "~/Library/Preferences/com.nyro.ai-gateway.plist",
      "~/Library/Saved Application State/com.nyro.ai-gateway.savedState",
    ]

    caveats <<~EOS
      If macOS still blocks Nyro after install, run:
        sudo xattr -rd com.apple.quarantine "/Applications/Nyro.app"
    EOS
  end

  on_linux do
    arch arm: "aarch64", intel: "amd64"
    sha256 arm:   "7edcc770b3f7ce88d99c974b76f62be0b7889bb2471701e8a0e9a0c251707271",
           intel: "846fd63fedf36c554cc42154601414dc097625cd9ec588d434b8f87ac6c43edb"

    url "https://github.com/nyroway/nyro/releases/download/v#{version}/Nyro_#{version}_#{arch}.AppImage"
    binary "Nyro_#{version}_#{arch}.AppImage", target: "nyro"

    preflight do
      system_command "/bin/chmod", args: ["+x", "#{staged_path}/Nyro_#{version}_#{arch}.AppImage"]
    end
  end

end
