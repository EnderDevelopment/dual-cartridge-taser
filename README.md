# Dual Cartridge Taser

A realistic dual cartridge taser with tethered probe wires and a clean HUD.

## Features

- Dual cartridge taser with tethered probe wires
- Reactivation feature with configurable delay
- Clean HUD displaying cartridge count

## Requirements

- FiveM server
- Yarn

## Installation

1. Download the script from the releases page.
2. Extract the files into your FiveM server's `resources` folder.
3. Add `start dual-cartridge-taser` to your server.cfg file.

## Usage

- Use the `/taser` command to activate the taser.
- The HUD will display the remaining cartridge count.
- The taser will reactivate after the configured delay.

## Configuration

Edit the `config.lua` file to customize the taser settings:

```lua
Config = {}

-- Taser settings
Config.Taser = {
    Cartridges = 2, -- Number of cartridges
    ProbeWireDuration = 5000, -- Duration of the probe wire effect in milliseconds
    ReactivationDelay = 10000, -- Delay before the taser can be reactivated in milliseconds
    HUD = {
        Position = { x = 0.5, y = 0.9 }, -- Position of the HUD on the screen
        Scale = 0.5, -- Scale of the HUD
        Color = { r = 255, g = 255, b = 255, a = 255 } -- Color of the HUD
    }
}
```

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=dual-cartridge-taser&utm_content=bottom) — describe it in one sentence and get the full source code.