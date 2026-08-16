# eel.nvim

![demo](demo.mp4)

eel (extensible emacs layer) is a plugin for Neovim that changes Neovim to use Emacs keybinds.
This plugin does not aim to provide every single Emacs functionality.

## Installation

Use `vim.pack`:
```lua
vim.pack.add({
    'https://github.com/benja2998/eel.nvim',
})
```

## Extending eel

eel provides an API to extend it with more functionality.

You can bind a key with the `eel.add_key` and the `eel.add_CX_key` functions.
The former will add a key prefixed by C-c, and the latter will add a key prefixed by C-x.

## Example configuration

```lua
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.number = true

vim.pack.add({
    'https://github.com/benja2998/eel.nvim',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/folke/tokyonight.nvim',
})

vim.cmd[[colorscheme tokyonight]]

require('lualine').setup()

local eel = require("eel")
eel.add_CX_key("d", "<CMD>Lex<CR>")
```
