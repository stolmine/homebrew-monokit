# Homebrew Tap for Monokit

Teletype-style scripting for a SuperCollider complex oscillator voice.

## Prerequisites

### 1. Install SuperCollider

```bash
brew install --cask supercollider
```

### 2. Install sc3-plugins

Required for the SVF filter and other UGens:

1. Download the latest release for your platform from:
   https://github.com/supercollider/sc3-plugins/releases

2. Extract the archive and copy the `SC3plugins` folder to:
   ```
   ~/Library/Application Support/SuperCollider/Extensions/
   ```

   Create the `Extensions` folder if it doesn't exist.

### 3. Verify SuperCollider works

Open SuperCollider.app, then in the IDE run:

```supercollider
Server.default.boot;
```

You should see the server boot successfully. Quit SuperCollider before proceeding.

## Install Monokit

```bash
brew tap stolmine/monokit
brew install monokit
```

## Run

```bash
monokit
```

On first run, monokit will:
1. Start sclang and boot the SuperCollider server
2. Load the monokit synth engine
3. Present the TUI interface

## File Locations

| What | Where |
|------|-------|
| Binary | `/opt/homebrew/bin/monokit` |
| SC Server | `/opt/homebrew/share/monokit/sc/` |
| User Config | `~/.config/monokit/config.toml` |
| Scenes | `~/.config/monokit/scenes/` |
| Presets | `~/.config/monokit/presets/` |

## Troubleshooting

### "sclang not found"

Ensure SuperCollider is installed. Monokit searches:
- `/Applications/SuperCollider.app/Contents/MacOS/sclang`
- `/opt/homebrew/bin/sclang`
- `/usr/local/bin/sclang`

### "Server timeout" or no audio

1. Check SuperCollider works standalone (see Prerequisites step 3)
2. Verify sc3-plugins is installed: `brew list sc3-plugins`
3. Check audio permissions in System Preferences → Privacy & Security → Microphone

### "Class not defined: SVF"

sc3-plugins is not installed or not found by SuperCollider:

```bash
brew install sc3-plugins
```

Then restart monokit.

## Uninstall

```bash
brew uninstall monokit
brew untap stolmine/monokit
```

User config at `~/.config/monokit/` is preserved. Remove manually if desired.

## More Info

- [Monokit Repository](https://github.com/stolmine/monokit)
- [SuperCollider](https://supercollider.github.io/)
