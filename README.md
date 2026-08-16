# eel.nvim

eel (extensible emacs layer) is a plugin for Neovim that changes Neovim to use Emacs keybinds.
This plugin does not aim to provide every single Emacs functionality.

## Extending eel

eel provides an API to extend it with more functionality.

You can bind a key with the `eel_add_key` and the `eel_add_CX_key` functions.
The former will add a key prefixed by C-c, and the latter will add a key prefixed by C-x.

Netrw doesn't play very nicely with eel, so it is recommended you install something like `oil.nvim` and add this to your configuration:
```lua
eel_add_CX_key("d", "<CMD>Oil<CR>")
```
