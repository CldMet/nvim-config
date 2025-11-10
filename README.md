# nvim-config

My Neovim config.

This repository contains my personal Neovim configuration written in Lua. I created this repo to maintain my own Neovim config and to provide a launch point for any one who wants to use the config. This config is inspired by youtube content creators, the Neovim Kickstart config and other Neovim users configs. Feel free to pinch code or fork your own version.

I use this config on linux and Win 11 WSL2, linux just works, WSL can throw some curveballs and appears to be much pickier with the config.  

## Requirements

- Neovim 0.11.* (do not use nightly builds)
- Git
- A Nerdfont (https://www.nerdfonts.com/font-downloads)
- A hardware accelerated terminal I like WezTerm on linux, and Windows Terminal for Win 11. 

## Installation

All install steps are written with debian based distros in mind, im using Ubuntu in WSL.

### Install dependencies

1. Install dependencies using apt

```bash
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip curl
```

### Neovim install

1. Download the latest release package for Neovim

```bash
curl -LO --output-dir /tmp https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
```

2. Unzip the downloaded file

```bash
tar xzvf /tmp/nvim-linux-x86_64.tar.gz
```

3. Move extracted file to /opt directory

```bash
sudo rm -rf /opt/nvim && sudo mv /tmp/nvim-linux-x86_64 /opt/nvim
```

4. Create symlink from /opt to /usr/loacl/bin for PATH 

```bash
sudo ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim
```

5. Clean up /tmp files

```bash
rm /tmp/nvim-linux-x86_64.tar.gz
```

### Neovim config install

1. Backup your existing Neovim config (if any):

```bash
mv ~/.config/nvim ~/.config/nvim.backup-$(date +%Y%m%d_%H%M%S)
```

2. Clone this repository into your Neovim config directory:

```bash
git clone https://github.com/CldMet/nvim-config.git ~/.config/nvim
```

3. Start Neovim:

```bash
nvim
```

On first run the plugin manager configured in this repo should bootstrap and install plugins automatically.

## What’s included

- init.lua and Lua module structure for configuring Neovim
- some defaults for editing, LSP, completion, treesitter and Git integration
- plugin list and plugin manager bootstrap (check the `lua/` directory for details)
- basic keymaps and utilities to make development smoother

## Basic usage

- Open Neovim with the command: `nvim`
- Use configured keymaps and commands described in the config files (see `lua/` directory)
- Update plugins with Lazy: `:Lazy sync`

## Basic keymap

- Exit Neovim: `:q + Enter`
- Navigation with vim: left:`h` down:`j` up:`k` right:`l`
- Enter insert mode (edit file) `i`
- Navigation in insert mode is with arrow keys
- Exit insert mode return to Normal mode: `esc key`
- Save current file `:w + Enter`
- Save all files `:wa + Enter`
- leader key to acces more commands is `space` in Normal mode

The which-key plugin is installed pressing the leader key will provide keymapping hints. 

## Repository structure

- init.lua — main entry point
- lua/ — modular Lua configuration (plugins, options, mappings, etc.)
- plugin/ or after/plugin/ — plugin autocommands or plugin-specific settings (if present)

Explore the `lua/` directory to see how things are organized and to customize settings to your liking.

## Customization

This config is meant to be customized:

- To change options, edit the relevant files in `lua/`
- To add or remove plugins, update the plugin list in the plugin manager configuration
- Keep your customizations in a separate file or branch if you want to preserve upstream changes

## Troubleshooting

- If Neovim fails to start after installing this config, restore your previous config from the backup you created.
- If a plugin fails to install, open Neovim and run the plugin manager's manual sync/install command.
- Check `:messages` or `:checkhealth` in Neovim for diagnostics.

## Contributing

This repo is my personal config. If you want to adapt or suggest improvements, feel free to open an issue or submit a PR — or fork and tailor it to your workflow.

## License

No license file included in this repository by default. If you want to use or redistribute this configuration, consider adding a LICENSE file (MIT is a common choice).

---

Created by CldMet
