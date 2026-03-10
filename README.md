# Homebrew Tap for Nyro

Homebrew Cask formulae for [Nyro AI Gateway](https://github.com/shuaijinchao/nyro).

## Install

```bash
brew tap shuaijinchao/nyro
brew install --cask --no-quarantine nyro
```

> The `--no-quarantine` flag prevents macOS Gatekeeper from blocking the unsigned app.

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

[Apache 2.0](https://github.com/shuaijinchao/nyro/blob/master/LICENSE)
