cask "nyro" do
  version "1.5.0"

  name "Nyro"
  desc "Local-first AI protocol gateway for OpenAI / Anthropic / Gemini"
  homepage "https://github.com/NYRO-WAY/NYRO"

  on_macos do
    arch arm: "aarch64", intel: "x64"
    sha256 arm:   "6a4702f0fea21da8682462659383a3bace19a18a894b0f312c8d63461b9c0f05",
           intel: "bec9e54c1c892305dd62e6802e8ed2fcb44884750e1813154fb9c590e3befa45"

    url "https://github.com/NYRO-WAY/NYRO/releases/download/v#{version}/Nyro_#{version}_#{arch}.dmg"

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
    sha256 arm:   "7cc3aa05c36975c448e5ddc39bbbbb2aee5d6155c9e879911e19d7b56f892643",
           intel: "37d8c627db3fce50eb0dabce709eb074b4ef9823098832d9c7bbeb3d0b2fe449"

    url "https://github.com/NYRO-WAY/NYRO/releases/download/v#{version}/Nyro_#{version}_#{arch}.AppImage"
    binary "Nyro_#{version}_#{arch}.AppImage", target: "nyro"

    preflight do
      system_command "/bin/chmod", args: ["+x", "#{staged_path}/Nyro_#{version}_#{arch}.AppImage"]
    end
  end

end
