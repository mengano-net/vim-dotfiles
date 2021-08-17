# NeoVim-dotfiles

### Configuration, plugins, dot files that I use to setup my NeoVim

## Prerequisites / Notes
- NeoVim 0.5+ (https://github.com/neovim/neovim)
- I have tested this configuration on macOS Big Sur, using built-in terminal, 
iTerm  3.4.8 and Alacritty.
- There are many but I'm using this plug-in manager: https://github.com/savq/paq-nvim

## Installation
- consider this file tree
[.config/nvim]$ tree
.
├── init.lua
├── lua
│   ├── options.lua
│   ├── plugins
│   │   ├── lexima.lua
│   │   ├── lsp.lua
│   │   ├── telescope.lua
│   │   └── treesitter.lua
│   ├── utils.lua

- clone all files and match directory structure under ~/.config/nvim/ directory
- download prebuilt version of Neovim or build your own (check neovim repo for information)
- First time you lunch, you will get a lot of errors since non of the plugins are installed; so
  first you mus tinstall them by running `:PaqInstall` on nvim's command.
- restart neovim
- familiarize yourself with all maps by issue this ocmmand on neovim's command prompt:   `:maps`
