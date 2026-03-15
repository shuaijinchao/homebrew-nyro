cask "nyro" do
  version "1.2.0"

  name "Nyro"
  desc "Local-first AI protocol gateway for OpenAI / Anthropic / Gemini"
  homepage "https://github.com/shuaijinchao/nyro"

  on_macos do
    arch arm: "aarch64", intel: "x64"
    sha256 arm:   "d1b486f97d56fa319a006c80338ae83d6206d8bd7c0ce1345b9dcbe9c6ade568",
           intel: "74de2ba69fae398884b9f46615da5fc893701673c5866553da41a6742fdbecbf"

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
    sha256 arm:   "95a51cc665ec8eafc8cf8883b14268f133f8f97a7c21ebc68729c922f57fda3e",
           intel: "84829be51110365451a9542ab78bbed14cbfd5c285522e2791896d0e6e8975eb"

    url "https://github.com/shuaijinchao/nyro/releases/download/v#{version}/Nyro_#{version}_#{arch}.AppImage"
    binary "Nyro_#{version}_#{arch}.AppImage", target: "nyro"

    preflight do
      system_command "/bin/chmod", args: ["+x", "#{staged_path}/Nyro_#{version}_#{arch}.AppImage"]
    end
  end
end
