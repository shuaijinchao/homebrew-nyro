cask "nyro" do
  version "1.1.0"

  name "Nyro"
  desc "Local-first AI protocol gateway for OpenAI / Anthropic / Gemini"
  homepage "https://github.com/shuaijinchao/nyro"

  on_macos do
    arch arm: "aarch64", intel: "x64"
    sha256 arm:   "407945f81a97af00d13feed0b7edb0e2bb17aeeab816a71eef89bbc84608861f",
           intel: "fb7e5f88c55825fbda6e7fd3680c24f9357e8cc75c2f0a46d1dc4de0f8fdf80a"

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
    sha256 arm:   "4ac4801ca6ad514fdbf557a889e11cf46e619fb9c8c73fd5d1737f9fa4cab036",
           intel: "ee8985b139cd12f329e7f02eab9d2571c92200112684b7d93a3c3b6e6f5daa54"

    url "https://github.com/shuaijinchao/nyro/releases/download/v#{version}/Nyro_#{version}_#{arch}.AppImage"
    binary "Nyro_#{version}_#{arch}.AppImage", target: "nyro"

    preflight do
      system_command "/bin/chmod", args: ["+x", "#{staged_path}/Nyro_#{version}_#{arch}.AppImage"]
    end
  end
end
