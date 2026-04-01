# Homebrew Tap for Nyro

Homebrew Cask formulae for [Nyro AI Gateway](https://github.com/NYRO-WAY/NYRO).

## Install

```bash
brew tap nyro-way/nyro
brew install --cask nyro
```

> The Cask runs a post-install step to clear the quarantine attribute for `Nyro.app` on macOS.

## Upgrade

```bash
brew upgrade --cask nyro
```

## Uninstall

```bash
brew uninstall --cask nyro
```

## Supported Platforms

| Platform | Format |
|---|---|
| macOS (Apple Silicon) | `.dmg` |
| macOS (Intel) | `.dmg` |
| Linux (x86_64) | `.AppImage` |
| Linux (aarch64) | `.AppImage` |

## License

[Apache 2.0](https://github.com/NYRO-WAY/NYRO/blob/master/LICENSE)
