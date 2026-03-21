cask "nyro" do
  version "1.4.0"

  name "Nyro"
  desc "Local-first AI protocol gateway for OpenAI / Anthropic / Gemini"
  homepage "https://github.com/shuaijinchao/Nyro"

  on_macos do
    arch arm: "aarch64", intel: "x64"
    sha256 arm:   "5a1402a643fcbaa18a265ae6ad7b94f3631314ac15b5ecf6b391cb05f14d2001",
           intel: "9a9242ab2b11ae84a24ef7c45d9d2f4942cdf22cbf7521c7401a9e098ebf73f6"

    url "https://github.com/shuaijinchao/nyro/releases/download/v#{version}/Nyro_#{version}_#{arch}.dmg"

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
    sha256 arm:   "564ff46c8012c8320ed20d5dc175b38780f4331a9b6ba64753d03be063f48bcf",
           intel: "524b6949a091e2ce1ff795765cf241a2b6de31007f0abfcf03fd62c83b6e69ec"

    url "https://github.com/shuaijinchao/nyro/releases/download/v#{version}/Nyro_#{version}_#{arch}.AppImage"
    binary "Nyro_#{version}_#{arch}.AppImage", target: "nyro"

    preflight do
      system_command "/bin/chmod", args: ["+x", "#{staged_path}/Nyro_#{version}_#{arch}.AppImage"]
    end
  end

end
