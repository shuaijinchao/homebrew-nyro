cask "nyro" do
  version "1.7.2"

  name "Nyro"
  desc "Local-first AI protocol gateway for OpenAI / Anthropic / Gemini"
  homepage "https://github.com/nyroway/nyro"

  on_macos do
    arch arm: "aarch64", intel: "x64"
    sha256 arm:   "39b9165c0e15c2bfbc23c45d035d87709f68e88d11d5aa4bae2e1b4d3f46247e",
           intel: "48bef9a5c0e40ac3501c523590728d0db2b254c1556c20978f0e339dba35dfae"

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
    sha256 arm:   "f4ab04b9ab3019e235486432598362a009454a6e7d0012814669ffa31fd25522",
           intel: "ce42fcf3c7bb762c87a9f05b247bac2c98b0b73c3bd1404def4bb09f2085b496"

    url "https://github.com/nyroway/nyro/releases/download/v#{version}/Nyro_#{version}_#{arch}.AppImage"
    binary "Nyro_#{version}_#{arch}.AppImage", target: "nyro"

    preflight do
      system_command "/bin/chmod", args: ["+x", "#{staged_path}/Nyro_#{version}_#{arch}.AppImage"]
    end
  end

end
