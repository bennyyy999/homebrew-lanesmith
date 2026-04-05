# homebrew-lanesmith

Homebrew tap for [LaneSmith CLI](https://github.com/bennyyy999/LaneSmith-CLI) — the bridge daemon that lets the [LaneSmith](https://lanesmith.dev) macOS app run terminal commands outside Apple's sandbox.

## Install

```sh
brew tap bennyyy999/lanesmith
brew install lanesmith-cli
```

## Upgrade

```sh
brew update
brew upgrade lanesmith-cli
```

## What is LaneSmith CLI?

LaneSmith is a native macOS app for iOS developers distributed via the Mac App Store. Because App Store apps run inside Apple's sandbox, they can't directly execute tools like `fastlane`, `xcodebuild`, or `git`.

LaneSmith CLI bridges that gap — it runs outside the sandbox on your machine and communicates with the app over a local WebSocket connection on `127.0.0.1`. Commands are executed by the daemon and output is streamed back to the app in real time.

```
┌───────────────────────┐       WebSocket        ┌──────────────────────────┐
│  LaneSmith (Sandboxed)│───── localhost:9847 ───▶│  lanesmith-cli (Daemon)  │
│  Mac App Store app    │                         │  Runs outside sandbox    │
│                       │  ◀── streams output ────│                          │
└───────────────────────┘                         └──────────────────────────┘
```

For full documentation — usage, configuration, security details, and uninstall instructions — see the [LaneSmith CLI repository](https://github.com/bennyyy999/LaneSmith-CLI).

## Requirements

- macOS 13 (Ventura) or later
- [LaneSmith](https://lanesmith.dev) app

## License

MIT
